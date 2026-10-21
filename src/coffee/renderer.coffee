# Download renderer object from HTML, it's simply our little canvas
# that we use for pretty much every operation
renderer = document.getElementById "renderer"

# Setup context based on renderer, for now we'll just configure it
# so that the image is sharp and the game is prioritized by the browser
context = renderer.getContext "2d",
	alpha: false

	willReadFrequently: true
	powerPreference: "high-performance"

context.imageSmoothingEnabled = false
context.imageSmoothingQuality = "low"

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
# Simple global boolean which defines if the window was resized
window.resized = false

# Define scale, which defines object's global scaling factor
# Also create previous scale, which helps us in several operations
scale = 1.00; prevScale = 1.00

window.render = (object, fill) ->
	context.globalAlpha = object.alpha / 100;

	if fill.r != undefined
		context.fillStyle = "rgb(" + fill.r + "," + fill.g + "," + fill.b + ")"
		context.fillRect object.x, object.y, object.width, object.height
	else
		context.drawImage fill, object.x, object.y, object.width, object.height;

window.setup = () ->
	if window.innerWidth / 16 > window.innerHeight / 9
		renderer.width = 16 * Math.floor window.innerHeight / 9
		renderer.height = window.innerHeight

		offset = Math.floor (window.innerWidth - renderer.width) / 2
		border =
			if offset >= 16
				Math.floor (window.innerWidth * 4) / 1280
			else
				Math.floor offset / 2

		renderer.style.borderTop = 0
		renderer.style.borderBottom = 0

		renderer.style.borderLeft = border + "px solid white"
		renderer.style.borderRight = renderer.style.borderLeft

		renderer.style.top = 0
		renderer.style.left = offset - (border * 2) + "px"
	else
		renderer.width = window.innerWidth
		renderer.height = 9 * Math.floor window.innerWidth / 16

		offset = Math.floor (window.innerHeight - renderer.height) / 2
		border =
			if offset >= 16
				Math.floor (window.innerHeight * 4) / 720
			else
				Math.floor offset / 2

		renderer.style.borderLeft = 0
		renderer.style.borderRight = 0

		renderer.style.borderTop = border + "px solid white"
		renderer.style.borderBottom = renderer.style.borderTop

		renderer.style.top = offset - (border * 2) + "px"
		renderer.style.left = 0

	renderer.style.width = renderer.width + "px"
	renderer.style.height = renderer.height + "px"

	lastWidth = window.innerWidth
	lastHeight = window.innerHeight

	prevScale = scale
	scale = renderer.width / 1280
	window.resized = true

window.refresh = (current) ->
	requestAnimationFrame window.refresh
	elapsed = current - last

	if elapsed > 1000 / frameLimit
		last = current - (elapsed % (1000 / frameLimit))
		frameCount++
		frameCurrent = Math.round 1000 / ((current - start) / frameCount)

		window.loop()

		frameCount = 0;
		start = current;

window.start = () ->
	last = window.performance.now()
	start = last

	window.refresh()

window.loop = () ->
	if lastWidth != window.innerWidth || lastHeight != window.innerHeight
		window.setup()

	if window.scene == 0
		window.menuHandler()

	window.resized = false

window.reScale = (value) ->
	value / prevScale

window.scale = (value) ->
	value * scale;

window.setup()
window.refresh();
