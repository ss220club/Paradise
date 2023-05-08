/obj/item/organ/internal/cyberimp/chest/hydration
	name = "Hydration pump implant"
	desc = "This implant will synthesize and pump into your bloodstream a small amount of hydration when you are thirsty."
	implant_color = "#0000AA"
	var/thirst_threshold = HYDRATION_LEVEL_MEDIUM
	var/synthesizing = FALSE
	slot = "stomach_hydration"

/obj/item/organ/internal/cyberimp/chest/hydration/on_life()
	if(synthesizing)
		return
	if(owner?.stat == DEAD)
		return
	if(owner.mind?.vampire)
		return
	if(ismachineperson(owner))
		return
	if(owner.hydration <= thirst_threshold)
		synthesizing = TRUE
		to_chat(owner, span_notice("You feel less thirsty..."))
		owner.adjust_hydration(50)
		addtimer(CALLBACK(src, .proc/synth_cool), 5 SECONDS)

/obj/item/organ/internal/cyberimp/chest/hydration/proc/synth_cool()
	synthesizing = FALSE

/datum/design/cyberimp_hydration_pump
	name = "Hydration pump implant"
	desc = "This implant will synthesize and pump into your bloodstream a small amount of hydration when you are thirsty."
	id = "ci-hydrationpump"
	req_tech = list("materials" = 5, "powerstorage" = 4, "biotech" = 4)
	build_type = PROTOLATHE | MECHFAB
	construction_time = 50
	materials = list(MAT_METAL = 600, MAT_GLASS = 600, MAT_GOLD = 500, MAT_URANIUM = 750)
	build_path = /obj/item/organ/internal/cyberimp/chest/hydration
	category = list("Medical")
