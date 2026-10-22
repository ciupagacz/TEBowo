# Download renderer object from HTML, it's simply our little canvas
# that we use for pretty much every operation
renderer = document.getElementById "renderer"

# Setup context based on renderer, for now we'll just configure it
# so that the game is prioritized by the browser
context = renderer.getContext "2d",
	alpha: false

	willReadFrequently: true
	powerPreference: "high-performance"

# Create frame-releated local variables
# Those three define elapsed, start and last time period
elapsed = 0
start = 0
last = 0 # then

# Global frame limit variable
frameLimit = 60
# Two variables defining debug frame count
frameCount = 0 # countFps
frameCurrent = 0 # currentFps

# Previous canvas size, used to check if the resolution was changed
lastWidth = 0; lastHeight = 0
# Global canvas offset from the top-left corner of the screen
window.offsetX = 0; window.offsetY = 0

# Define scale, which defines object's global scaling factor
# Also create previous scale, which helps us in several operations
scale = 1.00; prevScale = 1.00

window.render = (object, fill) ->
	context.globalAlpha = object.alpha / 100;

	if object.value == undefined
		if fill.r == undefined
			context.drawImage fill, object.x, object.y, object.width, object.height
		else
			context.fillStyle = "rgb(" + fill.r + "," + fill.g + "," + fill.b + ")"
			context.fillRect object.x, object.y, object.width, object.height
	else
		context.fillStyle = "rgb(" + fill.r + "," + fill.g + "," + fill.b + ")"
		context.font = object.size + "px orangeKid"

		object.value.split("\n").forEach (line, current) ->
			context.fillText line, object.x, object.y + (current * object.size), 1280

window.collision = (objectA, objectB) ->
	objectA.x < objectB.x + objectB.width &&
	objectA.x + objectA.width > objectB.x &&
	objectA.y < objectB.y + objectB.height &&
	objectA.y + objectA.height > objectB.y

window.loop = () ->
	if lastWidth != window.innerWidth || lastHeight != window.innerHeight
		setup()

	if window.scene == 0
		window.startHandler()
	if window.scene == 1
		window.menuHandler()

	window.render window.build.base, window.build.color
	window.render window.cursor.base, window.cursor.src

setup = () ->
	if window.innerWidth / 16 > window.innerHeight / 9
		renderer.width = 16 * Math.floor window.innerHeight / 9
		renderer.height = window.innerHeight

		border = (8 * window.innerWidth) / 1280

		renderer.style.borderTop = 0
		renderer.style.borderBottom = 0
		renderer.style.borderLeft = border + "px solid white"
		renderer.style.borderRight = renderer.style.borderLeft
	else
		renderer.width = window.innerWidth
		renderer.height = 9 * Math.floor window.innerWidth / 16

		border = (8 * window.innerHeight) / 720

		renderer.style.borderLeft = 0
		renderer.style.borderRight = 0
		renderer.style.borderTop = border + "px solid white"
		renderer.style.borderBottom = renderer.style.borderTop

	renderer.style.width = renderer.width + "px"
	renderer.style.height = renderer.height + "px"

	renderer.width = 1280
	renderer.height = 720

	context.imageSmoothingEnabled = false

	lastWidth = window.innerWidth
	lastHeight = window.innerHeight

	window.offsetX = ((window.innerWidth - renderer.width) / 2)
	window.offsetY = ((window.innerHeight - renderer.height) / 2)

	prevScale = scale
	scale = renderer.width / 1280

start = () ->
	last = window.performance.now()
	start = last

	refresh()

refresh = (current) ->
	requestAnimationFrame refresh
	elapsed = current - last

	if elapsed > 1000 / frameLimit
		last = current - (elapsed % (1000 / frameLimit))
		frameCount++
		frameCurrent = Math.round 1000 / ((current - start) / frameCount)

		window.loop()

		frameCount = 0;
		start = current;

# Initialize the canvas and begin the main loop
setup()
start();
