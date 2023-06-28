#define MIN_PLAYERS_FOR_LONEOP_EVENT 60
#define LONEOP_ANNOUNCE_DELAY 5 MINUTES
#define DEFAULT_LONEOP_TK 20


/datum/event/operative
	name = "Оперативник-одиночка"


/obj/item/radio/uplink/nuclear/lone
	uplink_type = UPLINK_TYPE_NUCLEAR_LONE

/datum/event/operative/proc/assign_nuke()
	var/obj/machinery/nuclearbomb/nuke = locate() in GLOB.machines
	if(!nuke)
		return null

	if(nuke.r_code == "ADMIN")
		nuke.r_code = rand(10000, 99999)

	return nuke.r_code


/datum/event/operative/proc/remember_nuke_code(datum/mind/synd_mind, nuke_code)
	synd_mind.store_memory("<B>Код от ядерной боеголовки</B>: [nuke_code]")
	to_chat(synd_mind.current, "<B>Код от ядерной боеголовки</B>: [nuke_code]")


/datum/event/operative/proc/pick_spawn_loc()
	var/list/possible_spawns = list()
	for(var/obj/effect/landmark/syndicate_spawn/syndicate_spawn in GLOB.landmarks_list)
		if(isturf(syndicate_spawn.loc))
			possible_spawns += get_turf(syndicate_spawn)
	if(length(possible_spawns))
		return pick(possible_spawns)


/datum/event/operative/proc/make_operative_body(mob/dead/observer/ghost, turf/spawn_loc)
	var/mob/living/carbon/human/new_character = makeBody(ghost)
	new_character.forceMove(spawn_loc)
	SSticker.mode.create_syndicate(new_character.mind)
	return new_character


/datum/event/operative/proc/equip_operative(mob/living/carbon/human/operative)
	SSticker.mode.equip_syndicate(operative, with_uplink = FALSE)
	SSticker.mode.update_syndicate_id(operative.mind, TRUE)
	var/additional_tk = max(0, (GLOB.player_list.len - MIN_PLAYERS_FOR_LONEOP_EVENT)*2)
	var/turf/operative_loc = get_turf(operative)
	var/obj/item/radio/uplink/nuclear/lone/uplink = new(operative_loc)
	if(!operative.equip_to_slot_if_possible(uplink, slot_in_backpack, disable_warning = TRUE))
		if(!operative.equip_to_appropriate_slot(uplink))
			operative.put_in_hands(uplink)
	uplink.hidden_uplink.uplink_owner = "[operative.key]"
	uplink.hidden_uplink.uses = DEFAULT_LONEOP_TK + additional_tk


/datum/event/operative/proc/rename_operative(mob/living/carbon/human/operative)
	var/name = "[syndicate_name()] Lone Operative"
	operative.real_name = name
	operative.dna.real_name = name
	var/mob/living/carbon/brain/brain = operative.internal_organs_slot["brain"]
	brain.dna.real_name = name
	var/obj/item/organ/external/head/head = operative.bodyparts_by_name["head"]
	head.dna.real_name = name


/datum/event/operative/proc/assign_operative_role(datum/mind/operative_mind)
	SSticker.mode.syndicates += operative_mind
	SSticker.mode.update_synd_icons_added(operative_mind)
	rename_operative(operative_mind.current)
	operative_mind.special_role = SPECIAL_ROLE_NUKEOPS
	operative_mind.assigned_role = SPECIAL_ROLE_NUKEOPS
	SSticker.mode.forge_syndicate_objectives(operative_mind)
	SSticker.mode.greet_syndicate(operative_mind)


/datum/event/operative/proc/make_operative()
	var/list/candidates = SSghost_spawns.poll_candidates("Do you wish to be a lone nuclear operative?", ROLE_OPERATIVE, TRUE, source = /obj/machinery/nuclearbomb/)
	var/turf/spawn_loc = pick_spawn_loc()
	var/nuke_code = assign_nuke()
	if(!spawn_loc || !nuke_code || !length(candidates))
		return FALSE

	var/mob/dead/observer/selected = pick(candidates)
	var/mob/living/carbon/human/operative = make_operative_body(selected, spawn_loc)
	var/datum/mind/operative_mind = operative.mind

	assign_operative_role(operative_mind)
	remember_nuke_code(operative_mind, nuke_code)
	equip_operative(operative)

	return TRUE

/datum/event/operative/start()
	processing = FALSE
	if(length(GLOB.player_list) < MIN_PLAYERS_FOR_LONEOP_EVENT)
		message_admins("Lone operative event failed to start. Not enough players.")
		return
	if(!make_operative())
		message_admins("Lone operative event failed to start. Not enough ghosts, nuke spawn points or nuke bombs.")
		return

#undef MIN_PLAYERS_FOR_LONEOP_EVENT
#undef LONEOP_ANNOUNCE_DELAY
#undef DEFAULT_LONEOP_TK
