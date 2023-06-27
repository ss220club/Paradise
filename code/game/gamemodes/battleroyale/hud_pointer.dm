/obj/screen/battleroyale_pointer
	name = "Zone center pointer"
	icon = 'icons/mob/screen_midnight.dmi'
	icon_state = "pinpointer_center"
	plane = ABOVE_HUD_PLANE
	layer = ABOVE_HUD_LAYER
	screen_loc = ui_battleroyale_locator

	var/mob/owner = null
	var/center_icon_state = "pinpointer_center"
	var/pointing_icon_state = "pinpointer_edge"

/obj/screen/battleroyale_pointer/Initialize(mapload)
	. = ..()
	if(!istype(SSticker.mode, /datum/game_mode/battleroyale))
		return

	var/datum/game_mode/battleroyale/battleroyale = SSticker.mode
	battleroyale.zone_locators += src
