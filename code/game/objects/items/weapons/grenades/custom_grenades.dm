/obj/item/grenade/chem_grenade/dirt
	payload_name = "dirt"
	desc = "From the makers of BLAM! brand foaming space cleaner, this bomb guarantees steady work for any janitor."
	stage = 2

/obj/item/grenade/chem_grenade/dirt/Initialize()
	. = ..()

	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/list/muck = list("blood","carbon","flour","radium")
	var/filth = pick(muck - "radium") // not usually radioactive

	B1.reagents.add_reagent(filth,25)
	if(prob(25))
		B1.reagents.add_reagent(pick(muck - filth,25)) // but sometimes...

	beakers += B1


/obj/item/grenade/chem_grenade/meat
	payload_name = "meat"
	desc = "Not always as messy as the name implies."
	stage = 2


/obj/item/grenade/chem_grenade/meat/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

	B1.reagents.add_reagent("blood",60)
	if(prob(5))
		B1.reagents.add_reagent("blood",1) // Quality control problems, causes a mess
	B2.reagents.add_reagent("cryoxadone",30)

	beakers.Add(B1, B2)

/obj/item/grenade/chem_grenade/holywater
	payload_name = "holy water"
	desc = "Then shalt thou count to three, no more, no less."
	stage = 2
	det_time = 30

/obj/item/grenade/chem_grenade/holywater/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B = new(src)
	B.reagents.add_reagent("holywater",100)
	beakers += B

/obj/item/grenade/chem_grenade/hellwater
	payload_name = "hell water"
	desc = "And he struck them down with an unholy fury that burn like one-thousands badmins."
	stage = 2
	det_time = 30

/obj/item/grenade/chem_grenade/hellwater/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)
	B1.reagents.add_reagent_list(list("hell_water" = 80, "sugar" = 20))
	B2.reagents.add_reagent_list(list("hell_water" = 60, "potassium" = 20, "phosphorus" = 20))

/obj/item/grenade/chem_grenade/drugs
	payload_name = "miracle"
	desc = "How does it work?"
	stage = 2

/obj/item/grenade/chem_grenade/drugs/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

	B1.reagents.add_reagent_list(list("space_drugs" = 25,"lsd" = 25, "potassium" = 25))
	B2.reagents.add_reagent_list(list("phosphorus" = 25, "sugar" = 25))

	beakers.Add(B1, B2)
	update_icon()

/obj/item/grenade/chem_grenade/ethanol
	payload_name = "ethanol"
	desc = "Ach, that hits the spot."
	stage = 2

/obj/item/grenade/chem_grenade/ethanol/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

	B1.reagents.add_reagent_list(list("ethanol" = 75, "potassium" = 25))
	B2.reagents.add_reagent_list(list("phosphorus" = 25, "sugar" = 25, "ethanol" = 25))

	beakers.Add(B1, B2)
	update_icon()

// -------------------------------------
// Grenades using new grenade assemblies
// -------------------------------------
/obj/item/grenade/chem_grenade/lube
	payload_name = "lubricant"
	desc = "Honk-lover."
	stage = 2

/obj/item/grenade/chem_grenade/lube/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	B1.reagents.add_reagent("lube",50)
	beakers += B1

/obj/item/grenade/chem_grenade/lube/remote/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/signaler)

/obj/item/grenade/chem_grenade/lube/prox/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/prox_sensor)

/obj/item/grenade/chem_grenade/lube/tripwire/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/infra)


// Basic explosion grenade
/obj/item/grenade/chem_grenade/explosion
	payload_name = "conventional"
	stage = 2

/obj/item/grenade/chem_grenade/explosion/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)
	B1.reagents.add_reagent_list(list("glycerol" = 30, "sacid" = 15)) // todo: someone says NG is overpowered, test.
	B2.reagents.add_reagent_list(list("sacid" = 15, "facid" = 30))
	beakers.Add(B1, B2)

// Assembly Variants
/obj/item/grenade/chem_grenade/explosion/remote/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/signaler)

/obj/item/grenade/chem_grenade/explosion/prox/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/prox_sensor)

/obj/item/grenade/chem_grenade/explosion/mine/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/mousetrap)

/obj/item/grenade/chem_grenade/explosion/mine_armed/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/mousetrap/armed)

// Water + Potassium = Boom

/obj/item/grenade/chem_grenade/waterpotassium
	payload_name = "chem explosive"
	stage = 2

/obj/item/grenade/chem_grenade/waterpotassium/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)
	B1.reagents.add_reagent("water",100)
	B2.reagents.add_reagent("potassium",100)
	beakers.Add(B1, B2)

/obj/item/grenade/chem_grenade/waterpotassium/remote/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/signaler)

/obj/item/grenade/chem_grenade/waterpotassium/prox/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/prox_sensor)


/obj/item/grenade/chem_grenade/waterpotassium/tripwire/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/infra)

/obj/item/grenade/chem_grenade/waterpotassium/tripwire_armed/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/infra/armed)

/obj/item/grenade/chem_grenade/waterpotassium/tripwire_armed_stealth/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/infra/armed/stealth)

// Basic EMP grenade
/obj/item/grenade/chem_grenade/emp
	payload_name = "EMP"
	stage = 2

/obj/item/grenade/chem_grenade/emp/Initialize()
	. = ..()

	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)
	B1.reagents.add_reagent("uranium",50)
	B2.reagents.add_reagent("iron",50)
	beakers.Add(B1, B2)

// Assembly Variants
/obj/item/grenade/chem_grenade/emp/remote/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/signaler)

/obj/item/grenade/chem_grenade/emp/prox/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/prox_sensor)

/obj/item/grenade/chem_grenade/emp/mine/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/mousetrap)

/obj/item/grenade/chem_grenade/large/monster
	payload_name = "gold slime"
	desc = "A standard grenade containing weaponized slime extract."
	stage = 2

/obj/item/grenade/chem_grenade/large/monster/Initialize()
	. = ..()
	var/obj/item/slime_extract/gold/B1 = new(src)
	B1.Uses = rand(1,3)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)
	B2.reagents.add_reagent("plasma",5 * B1.Uses)
	beakers.Add(B1, B2)

/obj/item/grenade/chem_grenade/large/monster/prox/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/prox_sensor)

/obj/item/grenade/chem_grenade/large/monster/mine/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/mousetrap)

/obj/item/grenade/chem_grenade/large/monster/remote/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/signaler)

/obj/item/grenade/chem_grenade/large/feast
	payload_name = "silver slime"
	desc = "A standard grenade containing weaponized slime extract."
	stage = 2

/obj/item/grenade/chem_grenade/large/feast/Initialize()
	. = ..()
	var/obj/item/slime_extract/silver/B1 = new(src)
	B1.Uses = rand(1,3)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)
	B2.reagents.add_reagent("plasma",5 * B1.Uses)
	beakers.Add(B1, B2)

// Flashbang
/obj/item/grenade/chem_grenade/flashbang
	payload_name = "Flashbang grenade"
	stage = 2

/obj/item/grenade/chem_grenade/flashbang/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)
	B1.reagents.add_reagent_list(list("aluminium" = 10, "cola" = 15, "oxygen" = 15, "chlorine" = 10))
	B2.reagents.add_reagent_list(list("phosphorus" = 15, "potassium" = 10, "sulfur" = 10))
	beakers.Add(B1, B2)

/obj/item/grenade/chem_grenade/flashbang/mine_armed

/obj/item/grenade/chem_grenade/flashbang/mine_armed/Initialize()
	. = ..()
	CreateDefaultTrigger(/obj/item/assembly/mousetrap/armed)
	layer = 2.9

// --------------------------------------
//  Syndie Kits
// --------------------------------------

/obj/item/storage/box/syndie_kit/remotegrenade
	name = "Remote Grenade Kit"

/obj/item/storage/box/syndie_kit/remotegrenade/Initialize()
	. = ..()
	new /obj/item/grenade/chem_grenade/explosion/remote(src)
	new /obj/item/multitool(src) // used to adjust the chemgrenade's signaller
	new /obj/item/assembly/signaler(src)
	return

/obj/item/storage/box/syndie_kit/remoteemp
	name = "Remote EMP Kit"

/obj/item/storage/box/syndie_kit/remoteemp/Initialize()
	. = ..()
	new /obj/item/grenade/chem_grenade/emp/remote(src)
	new /obj/item/multitool(src) // used to adjust the chemgrenade's signaller
	new /obj/item/assembly/signaler(src)
	return

/obj/item/storage/box/syndie_kit/remotelube
	name = "Remote Lube Kit"

/obj/item/storage/box/syndie_kit/remotelube/Initialize()
	. = ..()
	new /obj/item/grenade/chem_grenade/lube(src)
	new /obj/item/multitool(src) // used to adjust the chemgrenade's signaller
	new /obj/item/assembly/signaler(src)
	return
