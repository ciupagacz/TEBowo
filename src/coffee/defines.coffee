position = (x, y) ->
	x : x
	y : y

object = (x, y, width, height, alpha = 100) ->
	x: x
	y: y
	width: width
	height: height

	alpha: alpha

text = (x, y, size, value, rotation, alpha = 100) ->
	x: x
	y: y
	size: size
	value: value

	rotation: rotation
	alpha: alpha

image = (source) ->
	Object.assign(new Image(), { src: source })

color = (r, g, b) ->
	r: r
	g: g
	b: b

window.scene = 0

# temp
window.objectA = object(0, 0, 1920, 1080)
window.colorA = color(255, 0, 0)
window.imageA = image("tex/back/teacher.png")

window.menuBackground = [
	object(0, 0, 1280, 720)
	object(-1280, 0, 1280, 720)
	object(0, -720, 1280, 720)
	object(-1280, -720, 1280, 720)
]

window.menuBackgroundSource = [
	image("tex/back/menu.png")
	image("tex/back/menu.png")
	image("tex/back/menu.png")
	image("tex/back/menu.png")
]
