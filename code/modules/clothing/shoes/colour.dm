/obj/item/clothing/shoes/black
	name = "black shoes"
	icon_state = "black"
	item_color = "black"
	desc = "A pair of black shoes."

	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	dyeable = TRUE

/obj/item/clothing/shoes/black/redcoat
	item_color = "redcoat"	//Exists for washing machines. Is not different from black shoes in any way.

/obj/item/clothing/shoes/black/greytide
	flags = NODROP

/obj/item/clothing/shoes/black/neon
	name = "neon shoes"
	desc = "A pair of black shoes."
	icon_state = "neon"
	item_color = "neon"
	desc = "A pair of black shoes."
	actions_types = list(/datum/action/item_action/toggle_light, /datum/action/item_action/change_color)
	dyeable = FALSE
	color = null
	var/glow_active = FALSE
	var/brightness_on = 2

/obj/item/clothing/shoes/black/neon/attack_self(mob/living/user as mob)
	var/choice = input(user,"Neon shoes options") in list("Turn glow","Change Color")
	switch(choice)
		if("Turn glow")
			turn_glow()
		if("Change Color")
			change_color()

/obj/item/clothing/shoes/black/neon/update_icon()
	. = ..()

/obj/item/clothing/shoes/black/neon/proc/turn_glow()
	if(!glow_active)
		set_light(brightness_on)
		var/mutable_appearance/neone_overlay = mutable_appearance('icons/mob/feet.dmi',"neon_overlay")
		neone_overlay.color = color
		add_overlay(neone_overlay)
		glow_active = TRUE
	else
		set_light(0)
		cut_overlays()
		glow_active = FALSE
	update_icon()

/obj/item/clothing/shoes/black/neon/proc/change_color(mob/living/user as mob)
	var/temp = input(usr, "Please select color.", "Shoe color") as color
	color = temp
	light_color = temp
	update_icon()

/obj/item/clothing/shoes/black/neon/ui_action_click(mob/user, actiontype)
	if(actiontype == /datum/action/item_action/change_color)
		change_color()
	else if(actiontype == /datum/action/item_action/toggle_light)
		turn_glow()

/obj/item/clothing/shoes/brown
	name = "brown shoes"
	desc = "A pair of brown shoes."
	icon_state = "brown"
	dyeable = TRUE

/obj/item/clothing/shoes/brown/captain
	item_color = "captain"	//Exists for washing machines. Is not different from brown shoes in any way.

/obj/item/clothing/shoes/brown/hop
	item_color = "hop"		//Exists for washing machines. Is not different from brown shoes in any way.

/obj/item/clothing/shoes/brown/ce
	item_color = "chief"		//Exists for washing machines. Is not different from brown shoes in any way.

/obj/item/clothing/shoes/brown/rd
	item_color = "director"	//Exists for washing machines. Is not different from brown shoes in any way.

/obj/item/clothing/shoes/brown/cmo
	item_color = "medical"	//Exists for washing machines. Is not different from brown shoes in any way.

/obj/item/clothing/shoes/brown/qm
	item_color = "cargo"		//Exists for washing machines. Is not different from brown shoes in any way.

/obj/item/clothing/shoes/blue
	name = "blue shoes"
	icon_state = "blue"
	item_color = "blue"

/obj/item/clothing/shoes/green
	name = "green shoes"
	icon_state = "green"
	item_color = "green"

/obj/item/clothing/shoes/yellow
	name = "yellow shoes"
	icon_state = "yellow"
	item_color = "yellow"

/obj/item/clothing/shoes/purple
	name = "purple shoes"
	icon_state = "purple"
	item_color = "purple"

/obj/item/clothing/shoes/brown
	name = "brown shoes"
	icon_state = "brown"
	item_color = "brown"

/obj/item/clothing/shoes/red
	name = "red shoes"
	desc = "Stylish red shoes."
	icon_state = "red"
	item_color = "red"

/obj/item/clothing/shoes/white
	name = "white shoes"
	icon_state = "white"
	permeability_coefficient = 0.01
	item_color = "white"

/obj/item/clothing/shoes/leather
	name = "leather shoes"
	desc = "A sturdy pair of leather shoes."
	icon_state = "leather"
	item_color = "leather"

/obj/item/clothing/shoes/rainbow
	name = "rainbow shoes"
	desc = "Very gay shoes."
	icon_state = "rain_bow"
	item_color = "rainbow"

/obj/item/clothing/shoes/orange
	name = "orange shoes"
	icon_state = "orange"
	item_color = "orange"
	var/obj/item/restraints/handcuffs/shackles

/obj/item/clothing/shoes/orange/Destroy()
	QDEL_NULL(shackles)
	return ..()

/obj/item/clothing/shoes/orange/attack_self(mob/user)
	if(shackles)
		user.put_in_hands(shackles)
		shackles = null
		slowdown = SHOES_SLOWDOWN
		icon_state = "orange"

/obj/item/clothing/shoes/orange/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/restraints/handcuffs) && !shackles)
		if(user.drop_item())
			I.forceMove(src)
			shackles = I
			slowdown = 15
			icon_state = "orange1"
			return
	return ..()
