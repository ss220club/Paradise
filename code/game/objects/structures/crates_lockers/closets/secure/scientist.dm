/obj/structure/closet/secure_closet/RD
	name = "research director's locker"
	req_access = list(ACCESS_RD)
	icon_state = "rdsecure1"
	icon_closed = "rdsecure"
	icon_locked = "rdsecure1"
	icon_opened = "rdsecureopen"
	icon_broken = "rdsecurebroken"
	icon_off = "rdsecureoff"

/obj/structure/closet/secure_closet/RD/populate_contents()
	new /obj/item/cartridge/rd(src)
	new /obj/item/radio/headset/heads/rd(src)
	new /obj/item/tank/internals/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/suit/armor/reactive/teleport(src) //avoid to put in garmentbag
	new /obj/item/flash(src)
	new /obj/item/laser_pointer(src)
	new /obj/item/door_remote/research_director(src)
	new /obj/item/reagent_containers/food/drinks/mug/rd(src)
	new /obj/item/organ/internal/cyberimp/eyes/hud/diagnostic(src)
	new /obj/item/clothing/accessory/medal/science(src)
	new /obj/item/megaphone(src)	//added here deleted on maps
	new /obj/item/storage/garmentbag/RD(src)

/obj/structure/closet/secure_closet/research_reagents
	name = "research chemical storage closet"
	desc = "Store dangerous chemicals in here."
	icon_state = "rchemical1"
	icon_closed = "rchemical"
	icon_locked = "rchemical1"
	icon_opened = "medicalopen"
	icon_broken = "rchemicalbroken"
	icon_off = "rchemicaloff"
	req_access = list(ACCESS_TOX_STORAGE)

/obj/structure/closet/secure_closet/research_reagents/populate_contents()
	new /obj/item/reagent_containers/glass/bottle/reagent/morphine(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/morphine(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/morphine(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/morphine(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/insulin(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/insulin(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/insulin(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/insulin(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/phenol(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/ammonia(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/oil(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/acetone(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/acid(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/diethylamine(src)

/obj/structure/closet/secure_closet/research_reagents/broken

/obj/structure/closet/secure_closet/research_reagents/broken/Initialize(mapload)
	. = ..()
	populate_contents()
	bust_open()
	update_icon()

/obj/structure/closet/secure_closet/research_reagents/broken/populate_contents()
	new /obj/item/reagent_containers/glass/bottle/reagent/hydrogen(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/phosphorus(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/iodine(src)
	new /obj/item/reagent_containers/glass/bottle/reagent/ephedrine(src)
