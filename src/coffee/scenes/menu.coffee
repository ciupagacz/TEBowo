init = false

menuInit = () ->
	window.menu.background[0].x = 0
	window.menu.background[0].y = 0
	window.menu.background[1].x = window.scale -1280
	window.menu.background[1].y = 0
	window.menu.background[2].x = 0
	window.menu.background[2].y = window.scale -720
	window.menu.background[3].x = window.scale -1280
	window.menu.background[3].y = window.scale -720

	for cur in window.menu.background
		cur.width = window.scale 1280
		cur.height = window.scale 720

menuResize = () ->
	for cur in window.menu.background
		cur.x = window.reScale cur.x
		cur.x = window.scale cur.x

		cur.y = window.reScale cur.y
		cur.y = window.scale cur.y

	for cur in window.menu.background
		cur.width = window.scale 1280
		cur.height = window.scale 720

window.menuHandler = () ->
	if !init
		menuInit()
		init = true
	else if window.resized
		menuResize()

	for cur in window.menu.background
		window.render cur, window.menu.backgroundSrc

	for cur in window.menu.background
		cur.x += window.scale 1.6
		cur.y += window.scale 0.9

	if window.menu.background[3].x > 0
		window.menu.background[0].x = 0
		window.menu.background[0].y = 0
		window.menu.background[1].x = window.scale -1280
		window.menu.background[1].y = 0
		window.menu.background[2].x = 0
		window.menu.background[2].y = window.scale -720
		window.menu.background[3].x = window.scale -1280
		window.menu.background[3].y = window.scale -720
