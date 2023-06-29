#define DISARM_TIME (3 SECONDS)

/obj/structure/window/full/reinforced/Initialize(mapload, direct)
	. = ..()
	AddElement(/datum/element/airbag)

/**
 * Airbag Element
 *
 * Basically a fancy create on destroy.
 */
/datum/element/airbag
	/// The type we spawn when our parent is destroyed
	var/airbag_type = /obj/item/airbag/immediate_arm
	/// The type we spawn when we are disarmed.
	var/disarmed_type = /obj/item/airbag

/datum/element/airbag/Attach(datum/target)
	. = ..()
	if(!ismovable(target))
		return ELEMENT_INCOMPATIBLE

	RegisterSignal(target, COMSIG_ATOM_DESTRUCTION, PROC_REF(deploy_airbag))
	RegisterSignal(target, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(target, COMSIG_CLICK_ALT, PROC_REF(on_altclick))

/datum/element/airbag/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, list(COMSIG_ATOM_DESTRUCTION, COMSIG_ATOM_EXAMINE, COMSIG_CLICK_ALT))

/datum/element/airbag/proc/deploy_airbag(atom/movable/destroying_atom, damage_flag)
	SIGNAL_HANDLER

	new airbag_type(get_turf(destroying_atom))

/datum/element/airbag/proc/on_examine(datum/source, mob/user, list/examine_text)
	SIGNAL_HANDLER

	examine_text += span_warning("It has a blinking red light indicating an airbag is installed. <b>Alt+click</b> to disarm.")

/datum/element/airbag/proc/on_altclick(atom/movable/clicked_atom, mob/living/clicker)
	SIGNAL_HANDLER

	if(get_dist(clicker, clicked_atom) > 1)
		return
	INVOKE_ASYNC(src, PROC_REF(disarm_airbag), clicked_atom, clicker)

/datum/element/airbag/proc/disarm_airbag(atom/movable/clicked_atom, mob/living/clicker)
	to_chat(clicker, span_notice("You start disarming the airbag..."))
	if(do_after(clicker, DISARM_TIME, target = clicked_atom, progress = TRUE))
		new disarmed_type(get_turf(clicked_atom))
		Detach(clicked_atom)

// A fun little gadget!
/obj/item/airbag
	name = "airbag"
	desc = "A small package with an explosive attached. Stand clear!"
	icon = 'icons/obj/inflatable.dmi'
	icon_state = "airbag"
	max_integrity = 10
	/// The time in which we deploy
	var/detonate_time = 2 SECONDS
	/// The item we drop on detonation
	var/drop_type = /obj/structure/inflatable/window_airbag
	/// Are we immediately armed?
	var/immediate_arm = FALSE
	/// Are we currently armed?
	var/armed = FALSE
	/// The sound we play when armed
	var/armed_sound = 'code/modules/window_airbags/sound/airbag_arm.ogg'
	/// The sound we play when we go bang
	var/bang_sound = 'code/modules/window_airbags/sound/airbag_bang.ogg'

/obj/item/airbag/Initialize(mapload)
	. = ..()
	if(immediate_arm)
		arm()
		anchored = TRUE
	update_icon

/obj/item/airbag/update_icon()
	. = ..()
	icon_state = "[initial(icon_state)]_[armed ? "armed" : "safe"]"

/obj/item/airbag/attack_self(mob/user, modifiers)
	. = ..()
	arm()

/obj/item/airbag/proc/arm()
	if(armed)
		return
	if(!anchored)
		addtimer(CALLBACK(src, PROC_REF(deploy_anchor)), 1 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(bang)), detonate_time)
	armed = TRUE
	playsound(src, armed_sound, 50)
	update_icon()

// Anchors the airbag to the ground, namely to prevent air movement.
/obj/item/airbag/proc/deploy_anchor()
	if(!isturf(loc) || anchored)
		return
	anchored = TRUE

// Detonates the airbag, dropping the item and playing the sound.
/obj/item/airbag/proc/bang()
	var/obj/created_object = new drop_type(get_turf(src))
	playsound(src, bang_sound, 50, pressure_affected = FALSE)
	var/datum/effect_system/smoke_spread/smoke = new
	smoke.set_up(1,1, created_object.loc, 0)
	smoke.start()
	qdel(src)

/obj/item/airbag/immediate_arm
	immediate_arm = TRUE

/obj/structure/inflatable/window_airbag
	name = "window airbag"
	desc = "A quick deploying airbag that seals holes when a window is broken!"
	icon_state = "airbag_wall"
	torn = null // No debris left behind!
	intact = null

#undef DISARM_TIME
