/atom/movable/deathzone
	name = ""
	icon = 'icons/obj/engines_and_power/singularity.dmi'
	icon_state = "singularity_s1new"
	plane = ABOVE_LIGHTING_PLANE
	layer = ABOVE_LIGHTING_LAYER
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	flags = UNACIDABLE|INDESTRUCTIBLE
	mouse_opacity = MOUSE_OPACITY_OPAQUE

/atom/movable/deathzone/Uncrossed(atom/movable/AM)
	. = ..()

	if(ishuman(AM))
		var/datum/game_mode/battleroyale/battleroyale = SSticker.mode
		battleroyale?.fortniter_crossed_zone(AM)

/atom/movable/deathzone/ex_act()
	return

/proc/bresenhamCircle(centre_x, centre_y, center_z, radius)
	var x = 0
	var y = radius
	var delta = 1 - 2 * radius
	var error = 0

	var/list/points = list()

	while (y >= 0)
		points += locate(centre_x + x, centre_y + y, center_z)
		points += locate(centre_x + x, centre_y - y, center_z)
		points += locate(centre_x - x, centre_y + y, center_z)
		points += locate(centre_x - x, centre_y - y, center_z)
		error = 2 * (delta + y) - 1
		if ((delta < 0) && (error <= 0))
			delta += 2 * ++x + 1
			continue
		if ((delta > 0) && (error > 0))
			delta -= 2 * --y + 1
			continue
		delta += 2 * (++x - y--)

	return points

/proc/bresenhamCircleFilled(centre_x, centre_y, center_z, radius)
	var x = 0
	var y = radius
	var delta = 1 - 2 * radius
	var error = 0

	var/list/points = list()

	while (y >= 0)
		points += block(locate(centre_x + x, centre_y + y, center_z), locate(centre_x - x, centre_y + y, center_z))
		points += block(locate(centre_x + x, centre_y - y, center_z), locate(centre_x - x, centre_y - y, center_z))
		error = 2 * (delta + y) - 1
		if ((delta < 0) && (error <= 0))
			delta += 2 * ++x + 1
			continue
		if ((delta > 0) && (error > 0))
			delta -= 2 * --y + 1
			continue
		delta += 2 * (++x - y--)

	return points

/proc/bresenhamCircleInsideOut(centre_x, centre_y, center_z, radius)
	var x = 0
	var y = radius
	var delta = 1 - 2 * radius
	var error = 0

	var/list/points = list()

	while (y >= 0)
		points += block(locate(1, centre_y + y, center_z), locate(centre_x - x, centre_y + y, center_z))
		points += block(locate(centre_x + x, centre_y + y, center_z), locate(world.maxx, centre_y + y, center_z))
		points += block(locate(1, centre_y - y, center_z), locate(centre_x - x, centre_y - y, center_z))
		points += block(locate(centre_x + x, centre_y - y, center_z), locate(world.maxx, centre_y - y, center_z))
		error = 2 * (delta + y) - 1
		if ((delta < 0) && (error <= 0))
			delta += 2 * ++x + 1
			continue
		if ((delta > 0) && (error > 0))
			delta -= 2 * --y + 1
			continue
		delta += 2 * (++x - y--)

	points += block(locate(1, 1, center_z), locate(world.maxx, centre_y - radius, center_z))
	points += block(locate(1, world.maxy, center_z), locate(world.maxx, centre_y + radius, center_z))


	return points


/obj/structure/closet/crate/battleroyale_aidrop
	desc = "An airdrop crate."
	name = "airdrop crate"
	icon_state = "weaponcrate"
	icon_opened = "weaponcrateopen"
	icon_closed = "weaponcrate"

/obj/structure/closet/crate/battleroyale_aidrop/can_open()
	var/mob/user = usr
	if(!istype(user))
		return TRUE

	if(!do_after(user, 3 SECONDS, FALSE, src))
		return FALSE

	return TRUE

/obj/structure/closet/crate/battleroyale_aidrop/open(by_hand)
	. = ..()
	if(.)
		qdel(src)

