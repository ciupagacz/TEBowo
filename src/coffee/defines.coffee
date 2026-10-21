position = (x, y) ->
	x: x
	y: y

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

color = (r, g, b) ->
	r: r
	g: g
	b: b

image = (source) ->
	Object.assign new Image(), { src: source }

sound = (source) ->
	Object.assign new Audio(), { src: source }

window.scene = 0

window.menu =
	background: [
		object 0, 0, 0, 0
		object 0, 0, 0, 0
		object 0, 0, 0, 0
		object 0, 0, 0, 0
	]

	backgroundSrc: image "tex/back/menu.png"
