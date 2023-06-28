// FOR MOR INFO ON HTML CUSTOMISATION, SEE: https://github.com/Skyrat-SS13/Skyrat-tg/pull/4783

/mob/new_player/proc/get_title_html()
	var/dat = SStitle.title_html
	dat += {"<img src="loading_screen.gif" class="bg" alt="">"}

	if(SStitle.current_notice)
		dat += {"
		<div class="container_notice">
			<p class="menu_notice">[SStitle.current_notice]</p>
		</div>
	"}

	// Tell the server this page loaded.
	dat += {"
		<script>
			var ready_request = new XMLHttpRequest();
			ready_request.open("GET", "?src=[\ref(src)];title_is_ready=1", true);
			ready_request.send();
		</script>
	"}

	dat += "</body></html>"

	return dat
