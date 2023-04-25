// The purpose of "Decor" structures is to look like pre-existing objects without having functionality

/obj/structure/decor
	name = "Non-existent Decor"
	desc = "Yell at a coder!"
	anchored = TRUE
	density = TRUE

/obj/structure/decor/cryo
	name = "Arrived cryo pod"
	desc = "Some one is steal sleeping. Don't wake them up!"
	icon = 'icons/obj/machines/cryogenic2.dmi'
	icon_state = "body_scanner_1"
	max_integrity = 500
	resistance_flags = FIRE_PROOF | ACID_PROOF | INDESTRUCTIBLE

/obj/structure/decor/cryo/right
	icon_state = "body_scanner_1-r"
