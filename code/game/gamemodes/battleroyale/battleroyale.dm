GLOBAL_LIST_EMPTY(fortniters_spawn)

/datum/game_mode/battleroyale
	name = "battleroyale"
	config_tag = "battleroyale"
	required_players = 0//10
	ert_disabled = TRUE

	//list of minds of all living players
	var/list/fortniters = null
	//list of premapped spawnpoints
	var/list/possible_spawnpoints = null

	//list of safe to spawn station turfs
	var/list/safe_station_turfs = null
	//generated list of possible spawn locs
	var/list/possible_turfs_to_spawn = null

	var/start_equipment_type = BATTLEROYALE_STARTEQUIPMENT_TIER1

	var/maximum_circle_range = 0
	var/current_circle_range = 0
	var/target_circle_range = 0
	var/turf/zone_center = null
	var/turf/virtual_zone_center = null
	var/list/all_deathzones = null
	var/list/processing_deathzones = null

	//zone timings and size settings, [1] - zone range in percents from max range, [2] - time zone stays incative, [3] - time zone shrinks to the next zone
	var/list/zones_settings = BATTLEROYALE_ZONES_SETTINGS
	var/current_shrink_step = 1
	var/current_state = ZONE_STATE_INIT
	var/next_stage_time = 0
	var/time_between_shinks = 0
	var/next_shrink_time = 0


/datum/game_mode/battleroyale/announce()
	to_chat(world, "<B>The current game mode is - Battleroyale!</B>")
	// to_chat(world, "<B>There is a syndicate traitor on the station. Do not let the traitor succeed!</B>")

/datum/game_mode/battleroyale/pre_setup()

	possible_spawnpoints = GLOB.fortniters_spawn.Copy()

	fortniters = get_players_for_role()
	if(!length(fortniters))
		return FALSE

	generate_deathcircle()

	if(length(possible_spawnpoints) < length(fortniters))
		generate_spawnpoints()

	for(var/datum/mind/player as anything in fortniters)
		var/turf/spawnpoint = get_spawnpoint()
		if(!spawnpoint)
			break

		player.assigned_role = SPECIAL_ROLE_FORTNITER
		player.special_role = SPECIAL_ROLE_FORTNITER
		player.original = player.current

		player.current.forceMove(spawnpoint)

	return TRUE

/datum/game_mode/battleroyale/proc/get_spawnpoint()
	var/turf/spawnpoint = pick_n_take(possible_spawnpoints)

	if(!spawnpoint)
		return find_random_spawnpoint()

	return spawnpoint

/datum/game_mode/battleroyale/proc/find_random_spawnpoint()
	return pick_n_take(possible_turfs_to_spawn)

/datum/game_mode/battleroyale/proc/generate_spawnpoints()
	var/station_z = level_name_to_num(MAIN_STATION)
	LAZYINITLIST(safe_station_turfs)
	for(var/turf/turf_candidate as anything in block(locate(1, 1, station_z), locate(world.maxx, world.maxy, station_z)))
		if(istype(turf_candidate, /turf/space))
			continue
		if(turf_candidate.density)
			continue
		if(!turf_candidate.is_safe())
			continue

		var/is_dense = FALSE
		for(var/atom/movable/atom as anything in turf_candidate)
			if(atom.density)
				is_dense = TRUE
				break
		if(is_dense)
			continue

		safe_station_turfs += turf_candidate

	var/list/turfs_to_check = safe_station_turfs.Copy()
	LAZYINITLIST(possible_turfs_to_spawn)
	while(length(turfs_to_check))

		var/turf/picked_turf = pick(turfs_to_check)
		turfs_to_check -= block(
			locate(round(picked_turf.x - MINIMUM_PLAYERS_SPAWN_DISTANCE / 2), round(picked_turf.y - MINIMUM_PLAYERS_SPAWN_DISTANCE / 2), station_z),
			locate(round(picked_turf.x + MINIMUM_PLAYERS_SPAWN_DISTANCE / 2), round(picked_turf.y + MINIMUM_PLAYERS_SPAWN_DISTANCE / 2), station_z))
		possible_turfs_to_spawn += picked_turf



/datum/game_mode/battleroyale/post_setup()

	for(var/datum/mind/player as anything in fortniters)
		equip_fortniter(player.current)

	return ..()

/datum/game_mode/battleroyale/proc/equip_fortniter(mob/living/carbon/human/player)
	if(!istype(player))
		return

	var/static/list/possible_outfits
	if(!possible_outfits)
		possible_outfits = subtypesof(start_equipment_type)

	var/equip_type = pick(possible_outfits)
	var/datum/battleroyale_loadout/start_equipment/picked_equip = new equip_type
	for(var/item in picked_equip.items)
		player.equip_to_appropriate_slot(new item)


/datum/game_mode/battleroyale/declare_completion()
	..()
	return//Traitors will be checked as part of check_extra_completion. Leaving this here as a reminder.

// //zone timings and size settings, [1] - zone range in percents from max range, [2] - time zone stays incative, [3] - time zone shrinks to the next zone
// var/list/zones_settings = BATTLEROYALE_ZONES_SETTINGS
// var/current_shrink_step = 1
// var/current_state = ZONE_STATE_INIT
// var/next_stage_time = 0

	// var/maximum_circle_range = 0
	// var/current_circle_range = 0

/datum/game_mode/battleroyale/process()

	switch(current_state)
		if(ZONE_STATE_INIT)
			next_stage_time = world.time + zones_settings[current_shrink_step][ZONE_WAIT_TIME]
			current_state = ZONE_STATE_WAIT
			return process() //immediately go to the next step

		if(ZONE_STATE_WAIT)
			if(world.time > next_stage_time)
				goto_shrink_state()
				return process()

		if(ZONE_STATE_SHRINK)
			if(current_circle_range == target_circle_range)
				goto_wait_state()
				return process()

			if(world.time < next_shrink_time)
				return

			var/distance = get_dist(zone_center, virtual_zone_center)
			if(distance > (current_circle_range - target_circle_range))
				virtual_zone_center = get_step(virtual_zone_center, get_dir(virtual_zone_center, zone_center))

			current_circle_range = current_circle_range - 1
			var/list/new_turfs_to_fill = bresenhamCircle(virtual_zone_center.x, virtual_zone_center.y, virtual_zone_center.z, current_circle_range)
			var/iterator = 0
			var/list/new_deathzones = list()

			// to_chat(world, "---------------------------------------------------------------------")
			// to_chat(world, "Current deathzones len: [length(all_deathzones)]")
			// to_chat(world, "Circle range: [length(new_turfs_to_fill)]")

			for(var/turf/target as anything in new_turfs_to_fill)
				++iterator
				var/atom/movable/deathzone/deathzone
				if(iterator > all_deathzones.len)
					deathzone = new(target)
					new_deathzones += deathzone
				else
					deathzone = all_deathzones[iterator]
					deathzone.forceMove(target)

			for(var/i in iterator+1 to all_deathzones.len)
				var/atom/movable/deathzone/deathzone = all_deathzones[i]
				qdel(deathzone)

			if(all_deathzones.len > iterator)
				all_deathzones.Cut(iterator+1)
			all_deathzones += new_deathzones
			// to_chat(world, "Deathzones left: [length(all_deathzones)]")

			next_shrink_time = world.time + time_between_shinks

	return 0

/datum/game_mode/battleroyale/proc/goto_wait_state()
	current_state = ZONE_STATE_WAIT
	current_shrink_step = min(current_shrink_step + 1, length(zones_settings))
	next_stage_time = next_stage_time + zones_settings[current_shrink_step][ZONE_WAIT_TIME]
	virtual_zone_center = zone_center

	to_chat(world, span_danger("Отдыхаем!"))

/datum/game_mode/battleroyale/proc/goto_shrink_state()
	current_state = ZONE_STATE_SHRINK
	next_stage_time = world.time + zones_settings[current_shrink_step][ZONE_SHRINK_TIME]
	target_circle_range = round(maximum_circle_range * (zones_settings[min(length(zones_settings), current_shrink_step + 1)][ZONE_SIZE] / 100))

	time_between_shinks = round(zones_settings[current_shrink_step][ZONE_SHRINK_TIME] / (current_circle_range - target_circle_range))

	var/list/turfs_to_pick = list()
	for(var/turf/turf as anything in RANGE_TURFS(round(target_circle_range * 0.5), zone_center))
		if(turf.density)
			continue
		turfs_to_pick += turf

	if(length(turfs_to_pick))
		zone_center = pick(turfs_to_pick)

	to_chat(world, span_danger("Внимание! Зона начала сужение!"))


/datum/game_mode/battleroyale/check_finished() //to be called by ticker
	return FALSE

	// if((SSshuttle.emergency && SSshuttle.emergency.mode >= SHUTTLE_ENDGAME) || station_was_nuked)
	// 	return TRUE

	// if(length(fortniters) < 2)
	// 	return TRUE

	// return FALSE

/datum/game_mode/battleroyale/check_win() //universal trigger to be called at mob death, nuke explosion, etc. To be called from everywhere.
	var/datum/mind/looser = null
	for(var/datum/mind/player as anything in fortniters)
		if(player.original.stat != DEAD)
			continue
		looser = player
		break

	if(!looser)
		return

	fortniters -= looser
	var/looser_ckey = looser.original.last_known_ckey
	to_chat(world, span_danger("[looser_ckey] погиб! Игроков осталось: [length(fortniters)]"))


/datum/game_mode/battleroyale/generate_station_goals()
	return 0

/datum/game_mode/battleroyale/get_players_for_role()
	var/list/candidates = list()

	for(var/mob/new_player/player in GLOB.player_list)
		if(player.client && player.ready)
			candidates += player.mind

	return candidates


/datum/game_mode/battleroyale/proc/generate_deathcircle()
	maximum_circle_range = current_circle_range = round((world.maxx + world.maxy) / 40) * 10
	zone_center = virtual_zone_center = locate(round(world.maxx / 2), round(world.maxy / 2), level_name_to_num(MAIN_STATION))
	//zone_center = virtual_zone_center = locate(127, 105, level_name_to_num(MAIN_STATION))

	//var/list/circle_turfs = border_diamond_range_turfs(zone_center, current_circle_range)
	var/list/circle_turfs = bresenhamCircle(zone_center.x, zone_center.y, zone_center.z, current_circle_range)

	LAZYINITLIST(all_deathzones)
	for(var/turf/turf as anything in circle_turfs)
		var/atom/movable/deathzone/deathzone = new(turf)
		all_deathzones += deathzone


	return TRUE

/client/verb/test()
	set name = "Test"
	set category = "Server"

	var/static/objects = list()
	for(var/atom/thing as anything in objects)
		qdel(thing)

	var/range = input(usr) as num
	var/turf/zone_center = locate(round(world.maxx / 2), round(world.maxy / 2), level_name_to_num(MAIN_STATION))
	var/list/circle_turfs = bresenhamCircle(zone_center.x, zone_center.y, zone_center.z, range)

	for(var/turf/turf as anything in circle_turfs)
		var/atom/movable/deathzone/deathzone = new(turf)
		objects += deathzone
