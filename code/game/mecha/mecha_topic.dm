
////////////////////////////////////
///// Rendering stats window ///////
////////////////////////////////////

/obj/mecha/proc/get_stats_html()
	var/output = {"<html>
						<meta charset="UTF-8">
						<head><title>[name] data</title>
						<style>
						body {color: #00ff00; background: #000000; font-family:"Lucida Console",monospace; font-size: 12px;}
						hr {border: 1px solid #0f0; color: #0f0; background-color: #0f0;}
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
						    }, 1000);
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


/obj/mecha/proc/report_internal_damage()
	var/output = null
	var/list/dam_reports = list(
										"[MECHA_INT_FIRE]" = "<font color='red'><b>ВНУТРЕННИЙ ПОЖАР</b></font>",
										"[MECHA_INT_TEMP_CONTROL]" = "<font color='red'><b>ДИСФУНКЦИЯ СИСТЕМ ЖИЗНЕОБЕСПЕЧЕНИЯ</b></font>",
										"[MECHA_INT_TANK_BREACH]" = "<font color='red'><b>ПРОРЫВ ГАЗОВОГО БАЛЛОНА</b></font>",
										"[MECHA_INT_CONTROL_LOST]" = "<font color='red'><b>НАРУШЕНИЕ КАЛИБРОВКИ СИСТЕМ НАВИГАЦИИ</b></font> - <a href='?src=[UID()];repair_int_control_lost=1'>Recalibrate</a>",
										"[MECHA_INT_SHORT_CIRCUIT]" = "<font color='red'><b>КОРОТКОЕ ЗАМЫКАНИЕ</b></font>"
										)
	for(var/tflag in dam_reports)
		var/intdamflag = text2num(tflag)
		if(hasInternalDamage(intdamflag))
			output += dam_reports[tflag]
			output += "<br />"
	if(return_pressure() > WARNING_HIGH_PRESSURE)
		output += "<font color='red'><b>ОПАСНО ВЫСОКОЕ ДАВЛЕНИЕ В КАБИНЕ</b></font><br />"
	return output


/obj/mecha/proc/get_stats_part()
	var/integrity = obj_integrity/max_integrity*100
	var/cell_charge = get_charge()
	var/tank_pressure = internal_tank ? round(internal_tank.return_pressure(),0.01) : "Нет"
	var/tank_temperature = internal_tank ? internal_tank.return_temperature() : "Неизвестно"
	var/tank_temperature_c = internal_tank ? internal_tank.return_temperature() - T0C : "Неизвестно"
	var/cabin_pressure = round(return_pressure(),0.01)
	. = "[report_internal_damage()]"
	. += "[integrity<30?"<font color='red'><b>КРИТИЧЕСКИЙ УРОВЕНЬ ПОВРЕЖДЕНИЙ</b></font><br>":null]"
	. += "<b>Прочность: </b> [integrity]%<br>"
	. += "<b>Заряд батареи: </b>[isnull(cell_charge)?"Не установлена батарея.":"[cell.percent()]%"]<br>"
	. += "<b>Источник воздуха: </b>[use_internal_tank?"Внутренний баллон":"Окружающая среда"]<br>"
	. += "<b>Давление внутреннего баллона: </b>[tank_pressure]kPa<br>"
	. += "<b>Температура внутреннего баллона: </b>[tank_temperature]&deg;K|[tank_temperature_c]&deg;C<br>"
	. += "<b>Давление в кабине: </b>[cabin_pressure>WARNING_HIGH_PRESSURE ? "<font color='red'>[cabin_pressure]</font>": cabin_pressure]kPa<br>"
	. += "<b>Температура в кабине: </b> [return_temperature()]&deg;K|[return_temperature() - T0C]&deg;C<br>"
	. += "<b>Свет: </b>[lights?"Вкл":"Выкл"]<br>"
	. += "[dna ? "<b>ДНК-блокировка:</b><br> <span style='font-size:10px;letter-spacing:-1px;'>[dna]</span> \[<a href='?src=[UID()];reset_dna=1'>Сбросить</a>\]<br>" : ""]"
	. += "[defense_action.owner ? "<b>Защитный режим: </b> [defence_mode ? "Включен" : "Выключен"]<br>" : ""]"
	. += "[overload_action.owner ? "<b>Перегрузка приводов ног: </b> [leg_overload_mode ? "Включена" : "Выключена"]<br>" : ""]"
	. += "[thrusters_action.owner ? "<b>Трастеры: </b> [thrusters_active ? "Включен" : "Выключен"]<br>" : ""]"
	. += "[smoke_action.owner ? "<b>Дым: </b> [smoke]<br>" : ""]"
	. += "[zoom_action.owner ? "<b>Прицел: </b> [zoom_mode ? "Включен" : "Выключен"]<br>" : ""]"
	. += "[phasing_action.owner ? "<b>Фазовый модулятор: </b> [phasing ? "Включен" : "Выключен"]<br>" : ""]"

/obj/mecha/proc/get_commands()
	. = "<div class='wr'>"
	. += "<div class='header'>Электроника</div>"
	. += "<div class='links'>"
	. += "<a href='?src=[UID()];toggle_lights=1'>Переключение света</a><br>"
	. += "<b>Настройки радио:</b><br>"
	. += "Микрофон: <a href='?src=[UID()];rmictoggle=1'><span id='rmicstate'>[radio.broadcasting?"Вкл":"Выкл"]</span></a><br>"
	. += "Динамик: <a href='?src=[UID()];rspktoggle=1'><span id='rspkstate'>[radio.listening?"Вкл":"Выкл"]</span></a><br>"
	. += "Частота:"
	. += "<a href='?src=[UID()];rfreq=-10'>-</a>"
	. += "<a href='?src=[UID()];rfreq=-2'>-</a>"
	. += "<span id='rfreq'>[format_frequency(radio.frequency)]</span>"
	. += "<a href='?src=[UID()];rfreq=2'>+</a>"
	. += "<a href='?src=[UID()];rfreq=10'>+</a><br>"
	. += "</div>"
	. += "</div>"
	. += "<div class='wr'>"
	. += "<div class='header'>Внутренний баллон</div>"
	. += "<div class='links'>"
	. += "<a href='?src=[UID()];toggle_airtank=1'>Переключить использование внутреннего баллона</a><br>"
	. += "</div>"
	. += "</div>"
	. += "<div class='wr'>"
	. += "<div class='header'>Разрешения & Логирование</div>"
	. += "<div class='links'>"
	. += "<a href='?src=[UID()];toggle_id_upload=1'><span id='t_id_upload'>[add_req_access?"От":"За"]крыть панель ID доступа</span></a><br>"
	. += "<a href='?src=[UID()];toggle_maint_access=1'><span id='t_maint_access'>[maint_access?"Запретить":"Разрешить"] протоколы ТО</span></a><br>"
	. += "<a href='?src=[UID()];dna_lock=1'>ДНК-блокировка</a><br>"
	. += "<a href='?src=[UID()];view_log=1'>Посмотреть внутренние логи</a><br>"
	. += "<a href='?src=[UID()];change_name=1'>Поменять название экзокостюма</a><br>"
	. += "</div>"
	. += "</div>"
	. += "<div id='Меню экипировки'>[get_equipment_menu()]</div>"
	. += "<hr>"
	. += "<a href='?src=[UID()];eject=1'>Выйти</a><br>"

/obj/mecha/proc/get_equipment_menu() //outputs mecha html equipment menu
	. = ""
	if(equipment.len)
		. += "<div class='wr'>"
		. += "<div class='header'>Экипировка</div>"
		. += "<div class='links'>"
		for(var/obj/item/mecha_parts/mecha_equipment/W in equipment)
			. += "[W.name] <a href='?src=[W.UID()];detach=1'>Снять с экзокостюма</a><br>"
		. += "<b>Доступные слоты экипировки:</b> [max_equip-equipment.len]"
		. += "</div></div>"

/obj/mecha/proc/get_equipment_list() //outputs mecha equipment list in html
	if(!equipment.len)
		return
	. = "<b>Экипировка:</b><div style=\"margin-left: 15px;\">"
	for(var/obj/item/mecha_parts/mecha_equipment/MT in equipment)
		. += "<div id='\ref[MT]'>[MT.get_equip_info()]</div>"
	. += "</div>"


/obj/mecha/proc/get_log_html()
	var/output = {"<html><meta charset="UTF-8"><head><title>[name] Log</title></head><body style='font: 13px 'Courier', monospace;'>"}
	for(var/list/entry in log)
		output += {"<div style='font-weight: bold;'>[time2text(entry["time"],"DDD MMM DD hh:mm:ss")] 2555</div>
						<div style='margin-left:15px; margin-bottom:10px;'>[entry["message"]]</div>
						"}
	output += "</body></html>"
	return output

/obj/mecha/proc/get_log_tgui()
	var/list/data = list()
	for(var/list/entry in log)
		data.Add(list(list(
			"Время" = time2text(entry["time"], "hh:mm:ss"),
			"Сообщение" = entry["message"],
		)))
	return data

/obj/mecha/proc/output_access_dialog(obj/item/card/id/id_card, mob/user)
	if(!id_card || !user) return
	var/output = {"<html>
						<meta charset="UTF-8">
						<head><style>
						h1 {font-size:15px;margin-bottom:4px;}
						body {color: #00ff00; background: #000000; font-family:"Courier New", Courier, monospace; font-size: 12px;}
						a {color:#0f0;}
						</style>
						</head>
						<body>
						<h1>В этой системе присутствуют следующие коды доступа:</h1>"}
	for(var/a in operation_req_access)
		output += "[get_access_desc(a)] - <a href='?src=[UID()];del_req_access=[a];user=\ref[user];id_card=\ref[id_card]'>Удалить</a><br>"

	output += "<a href='?src=[UID()];del_all_req_access=1;user=\ref[user];id_card=\ref[id_card]'><br><b>Удалить всё</b></a><br>"

	output += "<hr><h1>Текущие коды доступа обнаружены на карте:</h1>"
	for(var/a in id_card.access)
		if(a in operation_req_access) continue
		if(!get_access_desc(a))
			continue //there's some strange access without a name
		output += "[get_access_desc(a)] - <a href='?src=[UID()];add_req_access=[a];user=\ref[user];id_card=\ref[id_card]'>Add</a><br>"

	output += "<a href='?src=[UID()];add_all_req_access=1;user=\ref[user];id_card=\ref[id_card]'><br><b>Add All</b></a><br>"
	output += "<hr><a href='?src=[UID()];finish_req_access=1;user=\ref[user]'>Finish</a> <font color='red'>(Предупреждение! Панель загрузки доступа будет заблокирована. Его можно разблокировать только через интерфейс экзокостюма.)</font>"
	output += "</body></html>"
	user << browse(output, "window=exosuit_add_access")
	onclose(user, "exosuit_add_access")
	return

/obj/mecha/proc/output_maintenance_dialog(obj/item/card/id/id_card,mob/user)
	if(!id_card || !user) return
	var/output = {"<html>
						<meta charset="UTF-8">
						<head>
						<style>
						body {color: #00ff00; background: #000000; font-family:"Courier New", Courier, monospace; font-size: 12px;}
						a {padding:2px 5px; background:#32CD32;color:#000;display:block;margin:2px;text-align:center;text-decoration:none;}
						</style>
						</head>
						<body>
						[add_req_access?"<a href='?src=[UID()];req_access=1;id_card=\ref[id_card];user=\ref[user]'>Настройка ключей доступа</a>":null]
						[maint_access?"<a href='?src=[UID()];maint_access=1;id_card=\ref[id_card];user=\ref[user]'>Начать/Остановить протоколы ТО</a>":null]
						[(state>0) ?"<a href='?src=[UID()];set_internal_tank_valve=1;user=\ref[user]'>Установить давление воздуха в кабине</a>":null]
						</body>
						</html>"}
	user << browse(output, "window=exosuit_maint_console")
	onclose(user, "exosuit_maint_console")
	return


////////////////////////////////
/////// Messages and Log ///////
////////////////////////////////

/obj/mecha/proc/occupant_message(message as text)
	if(message)
		if(occupant && occupant.client)
			to_chat(occupant, "[bicon(src)] [message]")
	return

/obj/mecha/proc/log_message(message as text,red=null)
	log.len++
	log[log.len] = list("time"=world.timeofday,"message"="[red?"<font color='red'>":null][message][red?"</font>":null]")
	return log.len

/obj/mecha/proc/log_append_to_last(message as text,red=null)
	var/list/last_entry = log[log.len]
	last_entry["message"] += "<br>[red?"<font color='red'>":null][message][red?"</font>":null]"
	return


/////////////////
///// Topic /////
/////////////////

/obj/mecha/Topic(href, href_list)
	..()
	if(href_list["update_content"])
		if(usr != occupant)	return
		send_byjax(occupant,"exosuit.browser","content",get_stats_part())
		return
	if(href_list["close"])
		return
	if(usr.stat > 0)
		return
	var/datum/topic_input/afilter = new /datum/topic_input(href,href_list)
	if(href_list["select_equip"])
		if(usr != occupant)	return
		var/obj/item/mecha_parts/mecha_equipment/equip = afilter.getObj("select_equip")
		if(equip)
			selected = equip
			occupant_message("Вы переключились на [equip]")
			visible_message("[src] переключился на [equip]")
			send_byjax(occupant, "exosuit.browser", "eq_list", get_equipment_list())
		return
	if(href_list["eject"])
		if(usr != occupant)	return
		go_out()
		return
	if(href_list["toggle_lights"])
		if(usr != occupant)	return
		toggle_lights()
		return
	if(href_list["toggle_airtank"])
		if(usr != occupant)	return
		toggle_internal_tank()
		return
	if(href_list["rmictoggle"])
		if(usr != occupant)	return
		radio.broadcasting = !radio.broadcasting
		send_byjax(occupant,"exosuit.browser","rmicstate",(radio.broadcasting?"Вкл":"Выкл"))
		return
	if(href_list["rspktoggle"])
		if(usr != occupant)	return
		radio.listening = !radio.listening
		send_byjax(occupant,"exosuit.browser","rspkstate",(radio.listening?"Вкл":"Выкл"))
		return
	if(href_list["rfreq"])
		if(usr != occupant)	return
		var/new_frequency = (radio.frequency + afilter.getNum("rfreq"))
		if((radio.frequency < PUBLIC_LOW_FREQ || radio.frequency > PUBLIC_HIGH_FREQ))
			new_frequency = sanitize_frequency(new_frequency)
		radio.set_frequency(new_frequency)
		send_byjax(occupant,"exosuit.browser","rfreq","[format_frequency(radio.frequency)]")
		return
	if(href_list["view_log"])
		if(usr != occupant)	return
		occupant << browse(get_log_html(), "window=exosuit_log")
		onclose(occupant, "exosuit_log")
		return
	if(href_list["change_name"])
		if(usr != occupant)	return
		var/newname = strip_html_simple(input(occupant,"Выберите новое имя экзокостюма","Переименовать экзокостюм",initial(name)) as text, MAX_NAME_LEN)
		if(newname && trim(newname))
			name = newname
			add_misc_logs(occupant, "переименовал экзокостюм на [newname]")
		else
			alert(occupant, "nope.avi")
		return
	if(href_list["toggle_id_upload"])
		if(usr != occupant)	return
		add_req_access = !add_req_access
		send_byjax(occupant,"exosuit.browser","t_id_upload","[add_req_access?"За":"От"]крыть панель ID доступа")
		return
	if(href_list["toggle_maint_access"])
		if(usr != occupant)	return
		if(state)
			occupant_message("<font color='red'>Протоколы ТО в действии.</font>")
			return
		maint_access = !maint_access
		send_byjax(occupant,"exosuit.browser","t_maint_access","[maint_access?"Запретить":"Разрешить"] протоколы ТО")
		return
	if(href_list["req_access"] && add_req_access)
		if(!in_range(src, usr))	return
		output_access_dialog(afilter.getObj("id_card"),afilter.getMob("user"))
		return
	if(href_list["maint_access"] && maint_access)
		if(!in_range(src, usr))	return
		var/mob/user = afilter.getMob("user")
		if(user)
			if(state==0)
				state = 1
				to_chat(user, "Крепежные болты активированы.")
				if(occupant)
					occupant.throw_alert("locked", /obj/screen/alert/mech_maintenance)
			else if(state==1)
				state = 0
				to_chat(user, "Крепежные болты убраны.")
				if(occupant)
					occupant.clear_alert("locked")
			output_maintenance_dialog(afilter.getObj("id_card"),user)
		return
	if(href_list["set_internal_tank_valve"] && state >=1)
		if(!in_range(src, usr))	return
		var/mob/user = afilter.getMob("user")
		if(user)
			var/new_pressure = input(user,"Ввод нового выходного давления","Настройки давления",internal_tank_valve) as num
			if(new_pressure)
				internal_tank_valve = new_pressure
				to_chat(user, "Внутреннее давление установлено на [internal_tank_valve]kPa.")
	if(href_list["add_req_access"] && add_req_access && afilter.getObj("id_card"))
		if(!in_range(src, usr))	return
		operation_req_access += afilter.getNum("add_req_access")
		output_access_dialog(afilter.getObj("id_card"),afilter.getMob("user"))
		return
	if(href_list["add_all_req_access"] && add_req_access && afilter.getObj("id_card"))
		if(!in_range(src, usr))
			return
		var/obj/item/card/id/mycard = afilter.getObj("id_card")
		var/list/myaccess = mycard.access
		for(var/a in myaccess)
			if(get_access_desc(a))
				operation_req_access += a
		output_access_dialog(afilter.getObj("id_card"),afilter.getMob("user"))
		return
	if(href_list["del_req_access"] && add_req_access && afilter.getObj("id_card"))
		if(!in_range(src, usr))	return
		operation_req_access -= afilter.getNum("del_req_access")
		output_access_dialog(afilter.getObj("id_card"),afilter.getMob("user"))
		return
	if(href_list["del_all_req_access"] && add_req_access && afilter.getObj("id_card"))
		if(!in_range(src, usr))
			return
		operation_req_access = list()
		output_access_dialog(afilter.getObj("id_card"),afilter.getMob("user"))
		return
	if(href_list["finish_req_access"])
		if(!in_range(src, usr))	return
		add_req_access = 0
		var/mob/user = afilter.getMob("user")
		user << browse(null,"window=exosuit_add_access")
		return
	if(href_list["dna_lock"])
		if(usr != occupant)
			return
		if(occupant && !iscarbon(occupant))
			to_chat(occupant, "<span class='danger'>у вас нет ДНК!</span>")
			return
		dna = occupant.dna.unique_enzymes
		occupant_message("Вы чувствуете легкий укол, когда игла берет ваш образец ДНК.")
		return
	if(href_list["reset_dna"])
		if(usr != occupant)	return
		dna = null
	if(href_list["repair_int_control_lost"])
		if(usr != occupant)	return
		occupant_message("Рекалибровка систем навигации.")
		log_message("Рекалибровка систем навигации начата.")
		var/T = loc
		spawn(100)
			if(T == loc)
				clearInternalDamage(MECHA_INT_CONTROL_LOST)
				occupant_message("<font color='blue'>Рекалибровка успешна.</font>")
				log_message("Рекалибровка систем навигации завершена с 0 ошибок.")
			else
				occupant_message("<font color='red'>Рекалибровка провалилась.</font>")
				log_message("Рекалибровка систем навигации провалилась. Обнаружена 1 ошибка.",1)

	//debug
	/*
	if(href_list["debug"])
		if(href_list["set_i_dam"])
			setInternalDamage(afilter.getNum("set_i_dam"))
		if(href_list["clear_i_dam"])
			clearInternalDamage(afilter.getNum("clear_i_dam"))
		return
	*/

	return
