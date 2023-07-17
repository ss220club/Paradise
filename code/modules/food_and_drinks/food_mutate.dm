/obj/item/reagent_containers/food/proc/check_and_mutate()
	if(!can_mutate)
		return FALSE

	var/list/mutation_reagents = list("mutagen", "mutadone", "neurotoxin", "omnizine", "????") //+ GLOB.rare_medicines.Copy() + GLOB.rare_chemicals.Copy() + GLOB.liver_toxins.Copy()
	var/mutation_chance_holder = mutation_chance
	for(var/r in reagents.reagent_list)
		var/datum/reagent/reagent = r
		for(var/mut in mutation_reagents)
			if(reagent.id == mut)
				mutation_chance_holder += reagent.volume

	if(prob(mutation_chance_holder))
		mutate()
		return TRUE

	return FALSE

/obj/item/reagent_containers/food/proc/mutate()
	playsound(src, 'sound/effects/meatslap.ogg', 100, 1)
	visible_message("<span class='alert'>[src.name] мутировал!</span>")

	var/obj/O = src
	new /mob/living/simple_animal/hostile/mimic/copy(O.loc, O)
