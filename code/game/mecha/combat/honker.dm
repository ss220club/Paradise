/obj/mecha/combat/honker
	desc = "Produced by \"Tyranny of Honk, INC\", this exosuit is designed as heavy clown-support. Used to spread the fun and joy of life. HONK!"
	name = "H.O.N.K"
	icon_state = "honker"
	initial_icon = "honker"
	step_in = 3
	max_integrity = 140
	deflect_chance = 60
	internal_damage_threshold = 60
	armor = list("melee" = -20, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	max_temperature = 25000
	infra_luminosity = 5
	operation_req_access = list(ACCESS_CLOWN)
	wreckage = /obj/structure/mecha_wreckage/honker
	add_req_access = 0
	max_equip = 3
	starting_voice = /obj/item/mecha_modkit/voice/honk
	var/squeak = 0

/obj/mecha/combat/honker/loaded/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/honker
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/banana_mortar
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/mousetrap_mortar
	ME.attach(src)

/obj/mecha/combat/honker/get_stats_part()
	var/integrity = obj_integrity/max_integrity*100
	var/cell_charge = get_charge()
	var/tank_pressure = internal_tank ? round(internal_tank.return_pressure(),0.01) : "Нет"
	var/tank_temperature = internal_tank ? internal_tank.return_temperature() : "Неизвестно"
	var/cabin_pressure = round(return_pressure(),0.01)
	var/output = {"<meta charset="UTF-8">[report_internal_damage()]
						[integrity<30?"<font color='red'><b>КРИТИЧЕСКИЙ УРОВЕНЬ ПОВРЕЖДЕНИЙ</b></font><br>":null]
						[internal_damage&MECHA_INT_TEMP_CONTROL?"<font color='red'><b>СБОЙ СИСТЕМ ХОНКА</b></font><br>":null]
						[internal_damage&MECHA_INT_TANK_BREACH?"<font color='red'><b>ХОНК ВНУТРЕННЕГО БАЛЛОНА</b></font><br>":null]
						[internal_damage&MECHA_INT_CONTROL_LOST?"<font color='red'><b>ХОНКУКАЧКА</b></font> - <a href='?src=[UID()];repair_int_control_lost=1'>Рекалихонка</a><br>":null]
						<b>ХОНКность: </b> [integrity]%<br>
						<b>Заряд ХОНКА: </b>[isnull(cell_charge)?"не установлена батарея":"[cell.percent()]%"]<br>
						<b>Источник воздуха: </b>[use_internal_tank?"Внутренний ХОНК":"Окружающая среда"]<br>
						<b>Давление баллона ХОНКА: </b>[tank_pressure]kPa<br>
						<b>Температура ХОНКА: </b>[tank_temperature]&deg;K|[tank_temperature - T0C]&deg;C<br>
						<b>Давление ХОНКА: </b>[cabin_pressure>WARNING_HIGH_PRESSURE ? "<font color='red'>[cabin_pressure]</font>": cabin_pressure]kPa<br>
						<b>Температура кабины ХОНКА: </b> [return_temperature()]&deg;K|[return_temperature() - T0C]&deg;C<br>
						<b>Свет: </b>[lights?"Вкл":"Выкл"]<br>
						[dna?"<b>ХОНК-блокировка:</b><br> <span style='font-size:10px;letter-spacing:-1px;'>[dna]</span> \[<a href='?src=[UID()];reset_dna=1'>Сбросить</a>\]<br>":null]
					"}
	return output

/obj/mecha/combat/honker/get_stats_html()
	var/output = {"<html>
						<meta charset="UTF-8">
						<head><title>[name] data</title>
						<style>
						body {color: #00ff00; background: #32CD32; font-family:"Courier",monospace; font-size: 12px;}
						hr {border: 1px solid #0f0; color: #fff; background-color: #000;}
						a {padding:2px 5px;;color:#0f0;}
						.wr {margin-bottom: 5px;}
						.header {cursor:pointer;}
						.open, .closed {background: #32CD32; color:#000; padding:1px 2px;}
						.links a {margin-bottom: 2px;padding-top:3px;}
						.visible {display: block;}
						.hidden {display: none;}
						</style>
						<script language='javascript' type='text/javascript'>
						[JS_BYJAX]
						[JS_DROPDOWNS]
						function ticker() {
						    setInterval(function(){
						        window.location='byond://?src=[UID()]&update_content=1';
						        document.body.style.color = get_rand_color_string();
						      document.body.style.background = get_rand_color_string();
						    }, 1000);
						}

						function get_rand_color_string() {
						    var color = new Array;
						    for(var i=0;i<3;i++){
						        color.push(Math.floor(Math.random()*255));
						    }
						    return "rgb("+color.toString()+")";
						}

						window.onload = function() {
							dropdowns();
							ticker();
						}
						</script>
						</head>
						<body>
						<div id='content'>
						[get_stats_part()]
						</div>
						<div id='eq_list'>
						[get_equipment_list()]
						</div>
						<hr>
						<div id='commands'>
						[get_commands()]
						</div>
						</body>
						</html>
					 "}
	return output

/obj/mecha/combat/honker/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Звуки ХОНКА:</div>
						<div class='links'>
						<a href='?src=[UID()];play_sound=sadtrombone'>Грустный тромбон</a>
						</div>
						</div>
						"}
	output += ..()
	return output


/obj/mecha/combat/honker/get_equipment_list()
	if(!equipment.len)
		return
	var/output = "<b>ХОНК системы:</b><div style=\"margin-left: 15px;\">"
	for(var/obj/item/mecha_parts/mecha_equipment/MT in equipment)
		output += "<div id='\ref[MT]'>[MT.get_equip_info()]</div>"
	output += "</div>"
	return output



/obj/mecha/combat/honker/mechstep(direction)
	var/result = step(src,direction)
	if(result)
		if(!squeak)
			playsound(src, "clownstep", 70, 1)
			squeak = 1
		else
			squeak = 0
	return result

/obj/mecha/combat/honker/Topic(href, href_list)
	..()
	if(href_list["play_sound"])
		switch(href_list["play_sound"])
			if("sadtrombone")
				playsound(src, 'sound/misc/sadtrombone.ogg', 50)
	return
