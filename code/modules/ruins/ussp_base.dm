/obj/effect/mob_spawn/human/ussp_captain
	name = "KS13 USSP Captain"
	mob_name = "KS13 USSP Captain"
	roundstart = FALSE
	death = FALSE
	id_job = "USSP Captain"
	icon = 'icons/obj/machines/cryogenic2.dmi'
	icon_state = "bodyscanner"
	important_info = "Вы - не антагонист! Вам запрещено создавать ИИ."
	description = "Вы - Генерал Космической Станции 13. Ввиду неизвестного происшествия, или от лишнего принятого на грудь, вы завалились в криокапсулу. Ваша задача выяснить что произошло, и по возможности связаться с Верховным Командованием."
	flavour_text = "Вы являетесь Капитаном станции СССП. Ваша задача восстановить станцию после неизвестного ЧС."
	outfit = /datum/outfit/ussp_captain
	allow_prefs_prompt = TRUE
	allow_species_pick = TRUE
	allow_gender_pick = TRUE
	allow_name_pick = TRUE
	pickable_species = list("Human")
	mob_species = /datum/species/human
	min_hours = 10
	exp_type = EXP_TYPE_LIVING

/obj/item/card/id/ussp_captain
	name = "USSP Captain ID card"
	desc = "An ID straight from USSP."
	icon_state = "ussp"
	item_state = "ussp"
	registered_name = "USSP Captain"
	assignment = "USSP Captain"
	rank = "Soviet Admiral"
	access = list(USSP_BAR, USSP_SECURITY, USSP_COMAND, 47, 76, 7)

/datum/outfit/ussp_captain/pre_equip(mob/living/carbon/human/H)
	if(H.dna.species)
		var/race = H.dna.species.name
		switch(race)
			if("Human")
				box = /obj/item/storage/box/soviet
	H.add_language("Neo-Russkiya")
	H.set_default_language(GLOB.all_languages["Neo-Russkiya"])

/datum/outfit/ussp_captain
	name = "USSP Captain"
	uniform = /obj/item/clothing/under/sovietofficer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	l_ear = /obj/item/radio/headset/alt/soviet // See del_types above
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/gun/projectile/automatic/pistol
	id = /obj/item/card/id/ussp_captain
	head = /obj/item/clothing/head/sovietofficerhat
	glasses = /obj/item/clothing/glasses/sunglasses
	implants = list(/obj/item/implant/weapons_auth, /obj/item/organ/internal/cyberimp/eyes/hud/security)

/obj/effect/mob_spawn/human/ussp_engineer
	name = "KS 13 USSP Engineer"
	mob_name = "KS 13 USSP Engineer"
	roundstart = FALSE
	death = FALSE
	id_job = "USSP Engineer"
	icon = 'icons/obj/machines/cryogenic2.dmi'
	icon_state = "bodyscanner"
	important_info = "Вы - не антагонист! Вам запрещено создавать ИИ."
	description = "Вы - инженер СССП станции! Ваша задача - Привести станцию впорядок, после какого-то инцидента."
	flavour_text = "Вы - Выживший инженер на Космической Станции 13. Вы мало помните что произошло, но вы знаете что вам нужно восстановить станцию."
	outfit = /datum/outfit/ussp_engineer
	allow_prefs_prompt = TRUE
	allow_species_pick = TRUE
	allow_gender_pick = TRUE
	allow_name_pick = TRUE
	pickable_species = list("Human")
	mob_species = /datum/species/human
	min_hours = 10
	exp_type = EXP_TYPE_LIVING

/obj/item/card/id/ussp_engineer
	name = "USSP Engineer ID card"
	desc = "An ID straight from USSP."
	icon_state = "ussp"
	item_state = "ussp"
	registered_name = "USSP Engineer"
	assignment = "USSP Engineer"
	rank = "Soviet Soldier"
	access = list(USSP_ENGINEERING)

/datum/outfit/ussp_engineer/pre_equip(mob/living/carbon/human/H)
	if(H.dna.species)
		var/race = H.dna.species.name
		switch(race)
			if("Human")
				box = /obj/item/storage/box/soviet
	H.add_language("Neo-Russkiya")
	H.set_default_language(GLOB.all_languages["Neo-Russkiya"])

/datum/outfit/ussp_engineer
	name = "USSP Engineer"
	uniform = /obj/item/clothing/under/soviet
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	l_ear = /obj/item/radio/headset/alt/soviet // See del_types above
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/ussp_engineer
	belt = /obj/item/storage/belt/utility/full/multitool
	glasses = /obj/item/clothing/glasses/meson/sunglasses
	head = /obj/item/clothing/head/beret/eng

/obj/effect/mob_spawn/human/ussp_security
	name = "KS 13 USSP Security Officer"
	mob_name = "KS 13 USSP Security Officer"
	roundstart = FALSE
	death = FALSE
	id_job = "USSP Security Officer"
	icon = 'icons/obj/machines/cryogenic2.dmi'
	icon_state = "bodyscanner"
	important_info = "Вы - не антагонист! Ваша задача защищать Космическую Станцию 13."
	description = "Вы - Офицер Безопасности Космической Станции 13! Постарайтесь держать станцию на плаву!"
	flavour_text = "Вы являетесь Офицером Безопасности на Космической Станции 13. Ваша задача - Защищать станцию и её Экипаж. При спасении Экипажа вы отдаёте приоритет Капитану."
	outfit = /datum/outfit/ussp_security
	allow_prefs_prompt = TRUE
	allow_species_pick = TRUE
	allow_gender_pick = TRUE
	allow_name_pick = TRUE
	pickable_species = list("Human")
	mob_species = /datum/species/human
	min_hours = 10
	exp_type = EXP_TYPE_LIVING

/obj/item/card/id/ussp_security
	name = "USSP Security ID card"
	desc = "An ID straight from USSP."
	icon_state = "ussp"
	item_state = "ussp"
	registered_name = "USSP Security Officer"
	assignment = "USSP Security Officer"
	access = list(USSP_BAR,USSP_SECURITY)

/datum/outfit/ussp_security/pre_equip(mob/living/carbon/human/H)
	if(H.dna.species)
		var/race = H.dna.species.name
		switch(race)
			if("Human")
				box = /obj/item/storage/box/soviet
	H.add_language("Neo-Russkiya")
	H.set_default_language(GLOB.all_languages["Neo-Russkiya"])

/datum/outfit/ussp_security
	name = "USSP Security Officer"
	uniform = /obj/item/clothing/under/soviet
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	l_ear = /obj/item/radio/headset/alt/soviet // See del_types above
	back = /obj/item/storage/backpack
	belt = /obj/item/storage/belt/security/sec
	r_pocket = /obj/item/gun/projectile/automatic/pistol
	id = /obj/item/card/id/ussp_security
	head = /obj/item/clothing/head/sovietsidecap

/obj/effect/mob_spawn/human/ussp_scientist
	name = "KS 13 USSP Scientist"
	mob_name = "KS 13 USSP Scientist"
	roundstart = FALSE
	death = FALSE
	id_job = "USSP Scientist"
	icon = 'icons/obj/machines/cryogenic2.dmi'
	icon_state = "bodyscanner"
	important_info = "Вы - не антагонист! Ваша задача - выполнять исследования."
	description = "Вы - Учённый СССП станции! Вы смутно припоминаете то, что из-за какого-то страшного инцидента на станции ушли в криосон. "
	flavour_text = "Ваша задача выполнять исследования. Вы - Учёный! В конце-то концов. "
	outfit = /datum/outfit/ussp_scientist
	allow_prefs_prompt = TRUE
	allow_species_pick = TRUE
	allow_gender_pick = TRUE
	allow_name_pick = TRUE
	pickable_species = list("Human")
	mob_species = /datum/species/human
	min_hours = 10
	exp_type = EXP_TYPE_LIVING

/datum/outfit/ussp_scientist
	name = "USSP Scientist"
	uniform = /obj/item/clothing/under/soviet
	shoes = /obj/item/clothing/shoes/combat
	r_ear = /obj/item/radio/headset/alt/soviet // See del_types above
	back = /obj/item/storage/backpack
	r_pocket = /obj/item/stack/medical/bruise_pack
	id = /obj/item/card/id/ussp_scientist
	belt = /obj/item/reagent_scanner/adv
	head = /obj/item/clothing/head/beret/sci

/datum/outfit/ussp_scientist/pre_equip(mob/living/carbon/human/H)
	if(H.dna.species)
		var/race = H.dna.species.name
		switch(race)
			if("Human")
				box = /obj/item/storage/box/soviet
	H.add_language("Neo-Russkiya")
	H.set_default_language(GLOB.all_languages["Neo-Russkiya"])


/obj/item/card/id/ussp_scientist
	name = "USSP Scientist ID card"
	desc = "An ID straight from USSP."
	icon_state = "ussp"
	item_state = "ussp"
	registered_name = "USSP Scientist"
	assignment = "USSP Scientist"
	rank = "Soviet Soldier"
	access = list(USSP_ENGINEERING, 47, 76, 7)
