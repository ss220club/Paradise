/obj/structure/closet/secure_closet/quartermaster
	name = "quartermaster's locker"
	req_access = list(ACCESS_QM)
	icon_state = "secureqm1"
	icon_closed = "secureqm"
	icon_locked = "secureqm1"
	icon_opened = "secureqmopen"
	icon_broken = "secureqmbroken"
	icon_off = "secureqmoff"

/obj/structure/closet/secure_closet/quartermaster/populate_contents()
	new /obj/item/tank/internals/emergency_oxygen(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/glasses/meson(src)
	new /obj/item/door_remote/quartermaster(src)
	new /obj/item/organ/internal/cyberimp/eyes/meson(src)
	new /obj/item/cartridge/quartermaster(src)
	new /obj/item/stamp/granted(src)	//added here deleted on maps
	new /obj/item/stamp/denied(src)
	new /obj/item/storage/garmentbag/quartermaster(src)
