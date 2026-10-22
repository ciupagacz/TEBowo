hiding = false
animationTimer = 0

window.startHandler = () ->
	startRender()
	startLogic()

startRender = () ->
	window.render window.start.background, window.start.backgroundColor
	window.render window.start.TEBulinek, window.start.TEBulinekSrc

	if !window.start.animation
		window.render window.start.main, window.start.mainColor
	else
		if animationTimer < 5
			window.render window.start.plate, window.start.plateSrc[1]
		else if animationTimer < 25
			window.render window.start.plate, window.start.plateSrc[0]
		else if animationTimer < 30
			window.render window.start.plate, window.start.plateSrc[1]
		else if animationTimer < 50
			window.render window.start.plate, window.start.plateSrc[0]
		else window.scene = 1

startLogic = () ->
	if !window.start.animation
		if !hiding
			window.start.main.alpha += 2
		else window.start.main.alpha -= 2

		if window.start.main.alpha >= 100 || window.start.main.alpha < 20
			hiding = !hiding
	else
		if animationTimer == 0
			window.start.backgroundColor = { r: 0, g: 120, b: 160 }

			window.start.sound.play();
		else if animationTimer == 25
			window.start.backgroundColor = { r: 255, g: 0, b: 0 }

		animationTimer++

init = false

window.menuHandler = () ->
	if !init
		menuInit()
		init = true

	menuRender()
	menuLogic()

menuInit = () ->
	window.menu.background[0].x = 0
	window.menu.background[0].y = 0
	window.menu.background[1].x = -1280
	window.menu.background[1].y = 0
	window.menu.background[2].x = 0
	window.menu.background[2].y = 720
	window.menu.background[3].x = -1280
	window.menu.background[3].y = 720

menuRender = () ->
	for cur in window.menu.background
		window.render cur, window.menu.backgroundSrc

menuLogic = () ->
	for cur in window.menu.background
		cur.x += 1.6
		cur.y -= 0.9

	if window.menu.background[3].x > 0
		window.menu.background[0].x = 0
		window.menu.background[0].y = 0
		window.menu.background[1].x = -1280
		window.menu.background[1].y = 0
		window.menu.background[2].x = 0
		window.menu.background[2].y = 720
		window.menu.background[3].x = -1280
		window.menu.background[3].y = 720
