/mob/new_player
	/// Title screen is ready to receive signals
	var/title_screen_is_ready = FALSE

/mob/new_player/Login()
	. = ..()
	show_title_screen()

/mob/new_player/Topic(href, list/href_list)
	. = ..()
	if(href_list["title_is_ready"])
		title_screen_is_ready = TRUE
		return

/**
 * Shows the titlescreen to a new player.
 */
/mob/new_player/proc/show_title_screen()
	winset(src, "title_browser", "is-disabled=false;is-visible=true")
	winset(src, "status_bar", "is-visible=false")

	var/datum/asset/assets = get_asset_datum(/datum/asset/simple/lobby) //Sending pictures to the client
	assets.send(src)

	update_title_screen()

/**
 * Hard updates the title screen HTML, it causes visual glitches if used.
 */
/mob/new_player/proc/update_title_screen()
	var/dat = get_title_html()

	src << browse(SStitle.current_title_screen, "file=loading_screen.gif;display=0")
	src << browse(dat, "window=title_browser")

/datum/asset/simple/lobby
	assets = list(
		"FixedsysExcelsior3.01Regular.ttf" = 'html/browser/FixedsysExcelsior3.01Regular.ttf',
	)

/**
 * Removes the titlescreen entirely from a mob.
 */
/mob/new_player/proc/hide_title_screen()
	if(client?.mob)
		winset(client, "title_browser", "is-disabled=true;is-visible=false")
		winset(client, "status_bar", "is-visible=true")
