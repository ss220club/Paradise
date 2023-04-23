/obj/effect/battleroyale_landmark
	name = "Landmark"
	icon = 'icons/misc/landmarks.dmi'
	icon_state = "standart"
	layer = 5
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF


/obj/effect/battleroyale_landmark/fortniter_spawn
	name = "fortniter spawn"

/obj/effect/battleroyale_landmark/fortniter_spawn/Initialize(mapload)
	. = ..()
	GLOB.fortniters_spawn += src.loc


/**
 * 	/obj/effect/battleroyale_landmark/loot_spawn/example
 * 		/// will spawn boneaxe
 * 		spawning = /obj/item/twohanded/fireaxe/boneaxe
 * 		/// will spawn loadout items
 * 		spawning = /datum/battleroyale_loadout/spawnable/tier1/ranged_energy
 * 		/// will spawn each item including items in loadout
 * 		spawning = list(
 * 			/obj/item/twohanded/fireaxe/boneaxe,
 * 			/datum/battleroyale_loadout/spawnable/tier1/ranged_energy,
 * 		)
 * 		/// will spawn boneaxe with 25% chance or loadout items with 75% chance
 * 		spawning = list(
 * 			list(/obj/item/twohanded/fireaxe/boneaxe = 25, /datum/battleroyale_loadout/spawnable/tier1/ranged_energy = 75),
 * 		)
 * 		/// this WILL NOT WORK. Use example above
 * 		spawning = list(
 * 			/obj/item/twohanded/fireaxe/boneaxe = 25,
 * 			/datum/battleroyale_loadout/spawnable/tier1/ranged_energy = 75,
 * 		)
 * 		/// will spawn toolbox and (boneaxe with 25% chance or loadout items with 75% chance)
 * 		spawning = list(
 * 			/obj/item/storage/toolbox,
 * 			list(/obj/item/twohanded/fireaxe/boneaxe = 25, /datum/battleroyale_loadout/spawnable/tier1/ranged_energy = 75),
 * 		)
 */

/obj/effect/battleroyale_landmark/loot_spawn
	name = "loot spawn"

	var/spawn_only_once = FALSE
	var/did_spawn = FALSE
	var/spawning = null

/obj/effect/battleroyale_landmark/loot_spawn/Initialize(mapload)
	. = ..()
	GLOB.battleroyale_loot_spawn += src

/obj/effect/battleroyale_landmark/loot_spawn/proc/spawn_loot()
	if(spawn_only_once && did_spawn)
		return

	if(islist(spawning))
		for(var/path_to_spawn in spawning)
			if(islist(path_to_spawn))
				path_to_spawn = pickweight(path_to_spawn)

			if(ispath(path_to_spawn, /datum/battleroyale_loadout))
				var/list/items_subtypes = subtypesof(path_to_spawn)
				if(length(items_subtypes))
					path_to_spawn = pick(items_subtypes)

				var/datum/battleroyale_loadout/loadout = new path_to_spawn()
				for(var/thing in loadout.items)
					if(islist(thing))
						thing = pick(thing)
					new thing (loc)

			else
				new path_to_spawn (loc)
	else
		if(ispath(spawning, /datum/battleroyale_loadout))
			var/list/items_subtypes = subtypesof(spawning)
			var/path_to_spawn = spawning
			if(length(items_subtypes))
				path_to_spawn = pick(items_subtypes)

			var/datum/battleroyale_loadout/loadout = new path_to_spawn()
			for(var/thing in loadout.items)
				if(islist(thing))
					thing = pick(thing)
				new thing (loc)
		else
			new spawning (loc)

	did_spawn = TRUE

