//Small sprites
/datum/action/innate/small_sprite_dragon
	name = "Toggle Giant Sprite"
	desc = "Others will always see you as giant."
	button_icon_state = "carp"
	background_icon_state = "bg_alien"
	var/small = FALSE
	var/small_icon = 'icons/mob/carp.dmi'
	var/small_icon_state = "carp"

/datum/action/innate/small_sprite_dragon/Trigger()
	..()
	if(!small)
		var/image/I = image(icon = small_icon, icon_state = small_icon_state, loc = owner)
		I.override = TRUE
		I.pixel_x -= owner.pixel_x
		I.pixel_y -= owner.pixel_y
		owner.add_alt_appearance("smallsprite", I, list(owner))
		small = TRUE
	else
		owner.remove_alt_appearance("smallsprite")
		small = FALSE
