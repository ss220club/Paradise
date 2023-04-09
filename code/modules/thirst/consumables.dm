/datum/reagent
	var/hydration_factor = -0.5 * REAGENTS_METABOLISM

/datum/reagent/on_mob_life(mob/living/M)
	. = ..()
	M.adjust_hydration(hydration_factor) // For thirst and hydration

//WATER!
/datum/reagent/water
	hydration_factor = 10 * REAGENTS_METABOLISM
	var/dirty = FALSE

/datum/reagents/proc/dirty_water()
	if(reagent_list)
		for(var/datum/reagent/water/water in reagent_list)
			water.dirty = TRUE
			return

/datum/reagents/proc/clear_dirty_water()
	if(reagent_list)
		for(var/datum/reagent/water/water in reagent_list)
			water.dirty = FALSE
			return

/datum/reagents/proc/is_dirty_water()
	if(reagent_list)
		for(var/datum/reagent/water/water in reagent_list)
			return water.dirty
	return FALSE

/datum/reagent/water/reaction_mob(mob/living/M, method, volume)
	. = ..()
	if(!dirty)
		return
	if((NO_THIRST in M.dna.species.species_traits) || M.dna.species.name == "Ash Walker")
		return
	if(method == REAGENT_INGEST && prob(60))
		M.ForceContractDisease(new /datum/disease/water_poisoning(0))

/datum/chemical_reaction/water_disinfection
	name = "Water"
	id = "water"
	result = "water"
	required_reagents = list("water" = 1, "charcoal" = 1)
	result_amount = 1
	mix_sound = null

/datum/chemical_reaction/water_disinfection/on_reaction(datum/reagents/holder, created_volume)
	. = ..()
	holder.clear_dirty_water()

/obj/structure/reagent_dispensers/watertank/Initialize(mapload)
	. = ..()
	reagents.dirty_water()

/obj/structure/reagent_dispensers/watertank/high/Initialize(mapload)
	. = ..()
	reagents.dirty_water()

/obj/structure/mopbucket/full/Initialize(mapload)
	. = ..()
	reagents.dirty_water()

//DRINKS!
/datum/reagent/consumable/drink
	hydration_factor = 6 * REAGENTS_METABOLISM

/datum/reagent/consumable/drink/cold
	hydration_factor = 4 * REAGENTS_METABOLISM

//ALCOHOL!
/datum/reagent/consumable/ethanol
	hydration_factor = -1 * REAGENTS_METABOLISM

//FOOD!

/datum/reagent/consumable/hot_coco
	hydration_factor = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/hot_ramen
	hydration_factor = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/mugwort
	hydration_factor = 6 * REAGENTS_METABOLISM

/datum/reagent/consumable/chicken_soup
	hydration_factor = 1 * REAGENTS_METABOLISM

