# Define position structure, used for objects with no size
position = (x = 0, y = 0) ->
	x: x
	y: y

# Define object structure, used for pretty much everything
object = (x = 0, y = 0, width = 1280, height = 720, alpha = 100) ->
	x: x
	y: y
	width: width
	height: height

	alpha: alpha

# Define text structure, used for every text object
text = (x = 0, y = 0, size = 0, value = "", alpha = 100) ->
	x: x
	y: y
	size: size

	value: value

	alpha: alpha

# Define color structure, used for declaring rgb color pallet
# Alpha is allways defined by the parent object
color = (r = 255, g = 255, b = 255) ->
	r: r
	g: g
	b: b

# Define image structure, which loads texture from given file
image = (source) ->
	Object.assign new Image(), { src: source }

# Define sound structure, which loads audio from given file
sound = (source) ->
	Object.assign new Audio(), { src: source }

# Create global scene integer, which defines current scene ID
# 0: Loading screen
# 1: Menu
window.scene = 0

# Create menu objects and stuff
window.menu =
	# Looped image in the background
	background: [
		object(); object(); object(); object()
	]

	# Source image of the background
	backgroundSrc: image "assets/textures/temp4.png"

# Create start scene objects and stuff
window.start =
	animation: false

	background: object()
	TEBulinek: object 760, 0, 520, 440
	plate: object 1120, 440, 160, 160

	main: text 270, 640, 64, "Naciśnij TEBulinka, aby rozpocząć", 20

	sound: sound "assets/sounds/general/load.mp3"

	backgroundColor: color 0, 50, 110
	mainColor: color()

	TEBulinekSrc: image "assets/textures/temp1.png"
	plateSrc: [ image "assets/textures/temp2.png"; image "assets/textures/temp3.png" ]

# Create global cursor object and its collision
window.cursor =
	base: object -24, -24, 24, 24
	src: image "assets/textures/mouse.png"

# Debug build
window.build =
	base: text 16, 32, 32, "unstable 22-10-2026", 50
	color: color()
