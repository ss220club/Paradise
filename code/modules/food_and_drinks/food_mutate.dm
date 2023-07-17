/obj/item/reagent_containers/food/proc/check_and_mutate()
	if(!can_mutate)
		return FALSE

	if(prob(mutation_chance))
		mutate()
		return TRUE

	return FALSE

/obj/item/reagent_containers/food/proc/mutate()
	playsound(src, 'sound/effects/meatslap.ogg', 100, 1)
	visible_message("<span class='alert'>[src.name] мутировал!</span>")

	new /mob/living/simple_animal/hostile/mimic/copy(loc, O)
