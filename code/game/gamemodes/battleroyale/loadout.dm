/datum/battleroyale_loadout
	var/list/items = null

/datum/battleroyale_loadout/start_equipment

/datum/battleroyale_loadout/start_equipment/tier1

/datum/battleroyale_loadout/start_equipment/tier1/first
	items = list(
		/obj/item/clothing/under/color/random,
		/obj/item/clothing/shoes/black,
		/obj/item/card/id/captains_spare,
		/obj/item/storage/backpack,
		/obj/item/radio/headset,
		list(/obj/item/crowbar, /obj/item/crowbar/red, /obj/item/crowbar/red/sec, /obj/item/crowbar/brass),
		list(/datum/battleroyale_loadout/spawnable/tier1/standart_armor, /datum/battleroyale_loadout/spawnable/tier1/standart_medicine),
		list(/datum/battleroyale_loadout/spawnable/tier1/ranged_energy, /datum/battleroyale_loadout/spawnable/tier1/m1911_pistol)
	)


/datum/battleroyale_loadout/spawnable

/datum/battleroyale_loadout/spawnable/tier1

/datum/battleroyale_loadout/spawnable/tier1/ranged_energy
	items = list(
		list(/obj/item/gun/energy/disabler, /obj/item/gun/energy/dominator, /obj/item/gun/energy/plasmacutter),
	)

/datum/battleroyale_loadout/spawnable/tier1/m1911_pistol
	items = list(
		/obj/item/gun/projectile/automatic/pistol/m1911,
		/obj/item/ammo_box/magazine/m45,
		/obj/item/ammo_box/magazine/m45,
	)

/datum/battleroyale_loadout/spawnable/tier1/melee_weapon
	items = list(
		list(/obj/item/twohanded/fireaxe, /obj/item/twohanded/fireaxe/boneaxe, /obj/item/storage/toolbox, /obj/item/storage/toolbox/emergency,
		 	 /obj/item/storage/toolbox/emergency/old, /obj/item/storage/toolbox/mechanical, /obj/item/storage/toolbox/mechanical/old,
			 /obj/item/storage/toolbox/electrical, /obj/item/storage/toolbox/fakesyndi, /obj/item/storage/toolbox/syndicate,
		)

	)

/datum/battleroyale_loadout/spawnable/tier1/standart_armor
	items = list(
		list(/obj/item/clothing/suit/armor/vest, /obj/item/clothing/suit/armor/vest/jacket, /obj/item/clothing/suit/armor/vest/combat,
			 /obj/item/clothing/suit/armor/vest/security, /obj/item/clothing/suit/armor/vest/blueshield, /obj/item/clothing/suit/armor/vest/bloody,
			 /obj/item/clothing/suit/armor/vest/warden, /obj/item/clothing/suit/armor/vest/warden/alt, /obj/item/clothing/suit/armor/vest/det_suit,
			 /obj/item/clothing/suit/armor/vest/ert, /obj/item/clothing/suit/armor/vest/ert/command, /obj/item/clothing/suit/armor/vest/ert/security,
			 /obj/item/clothing/suit/armor/vest/ert/security/paranormal, /obj/item/clothing/suit/armor/vest/ert/engineer, /obj/item/clothing/suit/armor/vest/ert/medical,
			 /obj/item/clothing/suit/armor/vest/ert/janitor, /obj/item/clothing/suit/armor/bone),
		list(/obj/item/clothing/head/helmet, /obj/item/clothing/head/helmet/visor, /obj/item/clothing/head/helmet/justice,
			 /obj/item/clothing/head/helmet/justice/escape, /obj/item/clothing/head/helmet/swat, /obj/item/clothing/head/helmet/swat/syndicate,
			 /obj/item/clothing/head/helmet/gladiator, /obj/item/clothing/head/helmet/skull, /obj/item/clothing/head/helmet/skull/Yorick,
			 /obj/item/clothing/head/helmet/durathread, /obj/item/clothing/head/helmet/ert/command, /obj/item/clothing/head/helmet/ert/security,
			 /obj/item/clothing/head/helmet/ert/security/paranormal, /obj/item/clothing/head/helmet/ert/engineer, /obj/item/clothing/head/helmet/ert/medical,
			 /obj/item/clothing/head/helmet/ert/janitor, /obj/item/clothing/head/beret/centcom/officer, /obj/item/clothing/head/beret/centcom/officer/navy),
	)

/datum/battleroyale_loadout/spawnable/tier1/standart_medicine
	items = list(
		list(/obj/item/storage/firstaid/fire, /obj/item/storage/firstaid/regular, /obj/item/storage/firstaid/doctor, /obj/item/storage/firstaid/brute),
		list(/obj/item/reagent_containers/hypospray/autoinjector/stimpack, /obj/item/reagent_containers/hypospray/autoinjector/stimulants),
	)


/datum/battleroyale_loadout/spawnable/tier2

/datum/battleroyale_loadout/spawnable/tier2/ranged_energy
	items = list(
		list(/obj/item/gun/energy, /obj/item/gun/energy/pulse/pistol),
	)

/datum/battleroyale_loadout/spawnable/tier2/miniuzi
	items = list(
		/obj/item/gun/projectile/automatic/mini_uzi,
		/obj/item/ammo_box/magazine/uzim9mm,
		/obj/item/ammo_box/magazine/uzim9mm,
	)

/datum/battleroyale_loadout/spawnable/tier2/deagle
	items = list(
		list(/obj/item/gun/projectile/automatic/pistol/deagle, /obj/item/gun/projectile/automatic/pistol/deagle/gold),
		/obj/item/ammo_box/magazine/m50,
		/obj/item/ammo_box/magazine/m50,
	)

/datum/battleroyale_loadout/spawnable/tier2/sfg
	items = list(
		/obj/item/gun/projectile/automatic/sfg,
		/obj/item/ammo_box/magazine/sfg9mm,
		/obj/item/ammo_box/magazine/sfg9mm,
	)

/datum/battleroyale_loadout/spawnable/tier2/tommygun
	items = list(
		/obj/item/gun/projectile/automatic/tommygun,
		/obj/item/ammo_box/magazine/tommygunm45,
		/obj/item/ammo_box/magazine/tommygunm45,
	)

/datum/battleroyale_loadout/spawnable/tier2/wt550
	items = list(
		/obj/item/gun/projectile/automatic/wt550,
		/obj/item/ammo_box/magazine/wt550m9,
		/obj/item/ammo_box/magazine/wt550m9,
	)

/datum/battleroyale_loadout/spawnable/tier2/standart_armor
	items = list(
		list(/obj/item/clothing/suit/armor/vest/capcarapace, /obj/item/clothing/suit/armor/vest/capcarapace/alt, /obj/item/clothing/suit/armor/bulletproof, /obj/item/clothing/suit/armor/laserproof),
		list(/obj/item/clothing/head/beret/centcom/officer, /obj/item/clothing/head/HoS, /obj/item/clothing/head/HoS/beret, /obj/item/clothing/head/warden,
			 /obj/item/clothing/head/officer, /obj/item/clothing/head/beret/sec, /obj/item/clothing/head/beret/sec/warden, /obj/item/clothing/head/beret/solgov/command,
			 /obj/item/clothing/head/beret/solgov/command/elite),
	)

/datum/battleroyale_loadout/spawnable/tier2/shields
	items = list(
		list(/obj/item/shield/riot, /obj/item/shield/riot/roman, /obj/item/shield/riot/buckler, /obj/item/shield/energy),
	)

/datum/battleroyale_loadout/spawnable/tier2/standart_medicine
	items = list(
		list(/obj/item/storage/firstaid/adv, /obj/item/storage/firstaid/syndie, /obj/item/storage/firstaid/tactical, /obj/item/storage/firstaid/ertm),
	)


/datum/battleroyale_loadout/spawnable/tier3

/datum/battleroyale_loadout/spawnable/tier3/ranged_energy
	items = list(
		list(/obj/item/gun/energy/laser/captain, /obj/item/gun/energy/lasercannon, /obj/item/gun/energy/pulse/carbine, /obj/item/gun/energy/xray),
	)

/datum/battleroyale_loadout/spawnable/tier3/sniper_rifle
	items = list(
		/obj/item/gun/projectile/automatic/sniper_rifle,
		/obj/item/ammo_box/magazine/sniper_rounds,
		/obj/item/ammo_box/magazine/sniper_rounds,
	)

/datum/battleroyale_loadout/spawnable/tier3/m90
	items = list(
		/obj/item/gun/projectile/automatic/m90,
		/obj/item/ammo_box/magazine/m556,
		/obj/item/ammo_box/magazine/m556,
	)

/datum/battleroyale_loadout/spawnable/tier3/lr30
	items = list(
		/obj/item/gun/projectile/automatic/lr30,
		/obj/item/ammo_box/magazine/lr30mag,
		/obj/item/ammo_box/magazine/lr30mag,
	)

/datum/battleroyale_loadout/spawnable/tier3/c20r
	items = list(
		/obj/item/gun/projectile/automatic/c20r,
		/obj/item/ammo_box/magazine/smgm45,
		/obj/item/ammo_box/magazine/smgm45,
	)

/datum/battleroyale_loadout/spawnable/tier3/standart_armor
	items = list(
		list(/obj/item/clothing/suit/armor/centcomm, /obj/item/clothing/suit/armor/heavy, /obj/item/clothing/suit/armor/tdome/red, /obj/item/clothing/suit/armor/tdome/green),
		list(/obj/item/clothing/head/helmet/thunderdome),
	)

/datum/battleroyale_loadout/spawnable/tier3/standart_medicine
	items = list(
		list(/obj/item/storage/firstaid/adv, /obj/item/storage/firstaid/syndie, /obj/item/storage/firstaid/tactical, /obj/item/storage/firstaid/ertm),
		list(/obj/item/reagent_containers/hypospray/autoinjector/survival, /obj/item/reagent_containers/hypospray/autoinjector/nanocalcium),
	)
