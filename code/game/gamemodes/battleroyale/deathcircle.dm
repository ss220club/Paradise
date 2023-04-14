
/atom/movable/deathzone
	name = ""
	icon = 'icons/obj/engines_and_power/singularity.dmi'
	icon_state = "singularity_s1new"
	plane = ABOVE_LIGHTING_PLANE
	layer = ABOVE_LIGHTING_LAYER
	density = FALSE
	opacity = FALSE
	flags = UNACIDABLE|INDESTRUCTIBLE

/atom/movable/deathzone/Crossed(atom/movable/AM, oldloc)
	. = ..()

	if(istype(AM, /atom/movable/deathzone))
		return

	qdel(AM)

/atom/movable/deathzone/Moved(atom/OldLoc, Dir, Forced)
	. = ..()
	for(var/mob/living/living in loc)
		living.gib()

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
