/turf/simulated/wall/indestructible
	name = "wall"
	desc = "Effectively impervious to conventional methods of destruction."
	explosion_block = 50
	icon = 'icons/turf/walls/wall.dmi'
	icon_state = "wall"
	canSmoothWith = list(
	/obj/structure/window/full/basic,
	/obj/structure/window/full/reinforced,
	/obj/structure/window/full/reinforced/tinted,
	/obj/structure/window/full/reinforced/polarized,
	/obj/structure/window/full/plasmabasic,
	/obj/structure/window/full/plasmareinforced,
	/turf/simulated/wall,
	/turf/simulated/wall/r_wall,
	/obj/structure/falsewall,
	/obj/structure/falsewall/reinforced,
	/obj/structure/falsewall/clockwork,
	/turf/simulated/wall/rust,
	/turf/simulated/wall/r_wall/rust,
	/turf/simulated/wall/r_wall/coated,
	/turf/simulated/wall/indestructible,
	/turf/simulated/wall/indestructible/metal,
	/turf/simulated/wall/indestructible/rusted,
	/turf/simulated/wall/indestructible/reinforced,
	/turf/simulated/wall/indestructible/reinforced/rusted,
	/turf/simulated/wall/indestructible/fakeglass)
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/dismantle_wall(devastated = 0, explode = 0)
	return

/turf/simulated/wall/indestructible/take_damage(dam)
	return

/turf/simulated/wall/indestructible/welder_act()
	return

/turf/simulated/wall/indestructible/ex_act(severity)
	return

/turf/simulated/wall/indestructible/blob_act(obj/structure/blob/B)
	return

/turf/simulated/wall/indestructible/singularity_act()
	return

/turf/simulated/wall/indestructible/singularity_pull(S, current_size)
	return

/turf/simulated/wall/indestructible/narsie_act()
	return

/turf/simulated/wall/indestructible/ratvar_act()
	return

/turf/simulated/wall/indestructible/burn_down()
	return

/turf/simulated/wall/indestructible/attackby(obj/item/I, mob/user, params)
	return

/turf/simulated/wall/indestructible/attack_hand(mob/user)
	return

/turf/simulated/wall/indestructible/attack_animal(mob/living/simple_animal/M)
	return

/turf/simulated/wall/indestructible/mech_melee_attack(obj/mecha/M)
	return

/turf/simulated/wall/indestructible/rpd_act()
	return

/turf/simulated/wall/indestructible/acid_act(acidpwr, acid_volume, acid_id)
	return

/turf/simulated/wall/indestructible/try_decon(obj/item/I, mob/user, params)
	return

/turf/simulated/wall/indestructible/rcd_deconstruct_act()
	return RCD_NO_ACT

/turf/simulated/wall/indestructible/thermitemelt(mob/user as mob, speed)
	return

/turf/simulated/wall/indestructible/fakeglass
	name = "window"
	icon = 'icons/turf/walls/fake_glass.dmi'
	icon_state = "fake_glass"
	opacity = FALSE
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
	/obj/structure/window/full/basic,
	/obj/structure/window/full/reinforced,
	/obj/structure/window/full/reinforced/tinted,
	/obj/structure/window/full/reinforced/polarized,
	/obj/structure/window/full/plasmabasic,
	/obj/structure/window/full/plasmareinforced,
	/turf/simulated/wall,
	/turf/simulated/wall/r_wall,
	/obj/structure/falsewall,
	/obj/structure/falsewall/reinforced,
	/obj/structure/falsewall/clockwork,
	/obj/machinery/door/airlock,
	/obj/machinery/door/airlock/centcom,
	/obj/machinery/door/airlock/shuttle,
	/obj/machinery/door/airlock/multi_tile/glass,
	/obj/machinery/door/airlock/external,
	/turf/simulated/wall/rust,
	/turf/simulated/wall/r_wall/rust,
	/turf/simulated/wall/r_wall/coated,
	/turf/simulated/wall/indestructible,
	/turf/simulated/wall/indestructible/metal,
	/turf/simulated/wall/indestructible/rusted,
	/turf/simulated/wall/indestructible/reinforced,
	/turf/simulated/wall/indestructible/reinforced/rusted,
	/turf/simulated/wall/indestructible/fakeglass)

/turf/simulated/wall/indestructible/fakeglass/plastitanium
	name = "window"
	icon = 'icons/turf/walls/fake_plastitanium_glass.dmi'
	icon_state = "fake_glass"
	opacity = FALSE
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
		/turf/simulated/wall/indestructible/fakeglass/plastitanium,
		/turf/simulated/wall/indestructible/iron)

/turf/simulated/wall/indestructible/rusted
	name = "reinforced wall"
	icon = 'icons/turf/walls/rusty_wall.dmi'
	icon_state = "wall"
	canSmoothWith = list(
	/obj/structure/window/full/basic,
	/obj/structure/window/full/reinforced,
	/obj/structure/window/full/reinforced/tinted,
	/obj/structure/window/full/reinforced/polarized,
	/obj/structure/window/full/plasmabasic,
	/obj/structure/window/full/plasmareinforced,
	/turf/simulated/wall,
	/turf/simulated/wall/r_wall,
	/obj/structure/falsewall,
	/obj/structure/falsewall/reinforced,
	/obj/structure/falsewall/clockwork,
	/obj/machinery/door/airlock,
	/obj/machinery/door/airlock/centcom,
	/obj/machinery/door/airlock/shuttle,
	/obj/machinery/door/airlock/multi_tile/glass,
	/obj/machinery/door/airlock/external,
	/turf/simulated/wall/rust,
	/turf/simulated/wall/r_wall/rust,
	/turf/simulated/wall/r_wall/coated,
	/turf/simulated/wall/indestructible,
	/turf/simulated/wall/indestructible/metal,
	/turf/simulated/wall/indestructible/rusted,
	/turf/simulated/wall/indestructible/reinforced,
	/turf/simulated/wall/indestructible/reinforced/rusted,
	/turf/simulated/wall/indestructible/fakeglass)
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/reinforced
	name = "reinforced wall"
	icon = 'icons/turf/walls/reinforced_wall.dmi'
	icon_state = "r_wall"
	canSmoothWith = list(
	/obj/structure/window/full/basic,
	/obj/structure/window/full/reinforced,
	/obj/structure/window/full/reinforced/tinted,
	/obj/structure/window/full/reinforced/polarized,
	/obj/structure/window/full/plasmabasic,
	/obj/structure/window/full/plasmareinforced,
	/turf/simulated/wall,
	/turf/simulated/wall/r_wall,
	/obj/structure/falsewall,
	/obj/structure/falsewall/reinforced,
	/obj/structure/falsewall/clockwork,
	/obj/machinery/door/airlock,
	/obj/machinery/door/airlock/centcom,
	/obj/machinery/door/airlock/shuttle,
	/obj/machinery/door/airlock/multi_tile/glass,
	/obj/machinery/door/airlock/external,
	/turf/simulated/wall/rust,
	/turf/simulated/wall/r_wall/rust,
	/turf/simulated/wall/r_wall/coated,
	/turf/simulated/wall/indestructible,
	/turf/simulated/wall/indestructible/metal,
	/turf/simulated/wall/indestructible/rusted,
	/turf/simulated/wall/indestructible/reinforced,
	/turf/simulated/wall/indestructible/reinforced/rusted,
	/turf/simulated/wall/indestructible/fakeglass)
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/reinforced/rusted
	name = "reinforced wall"
	icon = 'icons/turf/walls/rusty_reinforced_wall.dmi'
	icon_state = "r_wall"
	canSmoothWith = list(
	/obj/structure/window/full/basic,
	/obj/structure/window/full/reinforced,
	/obj/structure/window/full/reinforced/tinted,
	/obj/structure/window/full/reinforced/polarized,
	/obj/structure/window/full/plasmabasic,
	/obj/structure/window/full/plasmareinforced,
	/turf/simulated/wall,
	/turf/simulated/wall/r_wall,
	/obj/structure/falsewall,
	/obj/structure/falsewall/reinforced,
	/obj/structure/falsewall/clockwork,
	/obj/machinery/door/airlock,
	/obj/machinery/door/airlock/centcom,
	/obj/machinery/door/airlock/shuttle,
	/obj/machinery/door/airlock/multi_tile/glass,
	/obj/machinery/door/airlock/external,
	/turf/simulated/wall/rust,
	/turf/simulated/wall/r_wall/rust,
	/turf/simulated/wall/r_wall/coated,
	/turf/simulated/wall/indestructible,
	/turf/simulated/wall/indestructible/metal,
	/turf/simulated/wall/indestructible/rusted,
	/turf/simulated/wall/indestructible/reinforced,
	/turf/simulated/wall/indestructible/reinforced/rusted,
	/turf/simulated/wall/indestructible/fakeglass)
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/wood
	name = "wooden wall"
	desc = "A wall with wooden plating against any method of destruction. Very stiff."
	icon = 'icons/turf/walls/wood_wall.dmi'
	icon_state = "wood"
	canSmoothWith = list(
	/turf/simulated/wall/indestructible/wood,
	/turf/simulated/wall/mineral/wood,
	/obj/structure/falsewall/wood,
	/turf/simulated/wall/mineral/wood/nonmetal)
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/necropolis
	name = "necropolis wall"
	desc = "A seemingly impenetrable wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "necro"
	explosion_block = 50
	baseturf = /turf/simulated/wall/indestructible/necropolis

/turf/simulated/wall/indestructible/boss
	name = "necropolis wall"
	desc = "A thick, seemingly indestructible stone wall."
	icon = 'icons/turf/walls/boss_wall.dmi'
	icon_state = "wall"
	canSmoothWith = list(/turf/simulated/wall/indestructible/boss, /turf/simulated/wall/indestructible/boss/see_through)
	explosion_block = 50
	baseturf = /turf/simulated/floor/plating/asteroid/basalt
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/boss/see_through
	opacity = FALSE

/turf/simulated/wall/indestructible/hierophant
	name = "wall"
	desc = "A wall made out of a strange metal. The squares on it pulse in a predictable pattern."
	icon = 'icons/turf/walls/hierophant_wall.dmi'
	icon_state = "wall"
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/uranium
	icon = 'icons/turf/walls/uranium_wall.dmi'
	icon_state = "uranium"
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/metal
	icon = 'icons/turf/walls/wall.dmi'
	icon_state = "wall"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
		/turf/simulated/wall/indestructible/metal,
		/turf/simulated/wall/indestructible/fakeglass)

/turf/simulated/wall/indestructible/abductor
	name = "alien wall"
	icon = 'icons/turf/walls/abductor_wall.dmi'
	desc = "A wall with alien alloy plating."
	icon_state = "abductor"
	canSmoothWith = list(/turf/simulated/wall/indestructible/abductor)
	smooth = SMOOTH_TRUE

/turf/simulated/wall/indestructible/splashscreen
	name = "Space Station 13"
	icon = 'config/title_screens/images/blank.png'
	icon_state = ""
	layer = FLY_LAYER
	flags = NO_SCREENTIPS

/turf/simulated/wall/indestructible/sandstone
	name = "sandstone wall"
	icon = 'icons/turf/walls/sandstone_wall.dmi'
	icon_state = "sandstone"
	canSmoothWith = list(/turf/simulated/wall/indestructible/sandstone)
	smooth = SMOOTH_TRUE
/turf/simulated/wall/indestructible/rock
	name = "rock"
	icon = 'icons/turf/walls/rock_wall.dmi'
	icon_state = "rockEXAMPLE"
	canSmoothWith = list(/turf/simulated/wall/indestructible/rock)
	smooth = SMOOTH_TRUE
/turf/simulated/wall/indestructible/iron
	name = "plastitanium wall"
	icon = 'icons/turf/walls/plastitanium_wall.dmi'
	icon_state = "shuttle"
	canSmoothWith = list(
		/turf/simulated/wall/indestructible/fakeglass/plastitanium,
		/turf/simulated/wall/indestructible/iron)
	smooth = SMOOTH_TRUE
