renderer = document.getElementById "renderer"

context = renderer.getContext "2d",
	alpha: true

	willReadFrequently: true
	powerPreference: "high-performance"

context.imageSmoothingEnabled = false
context.imageSmoothingQuality = "low"

window.render = (object, fill) ->
	context.globalAlpha = object.alpha / 100;

	if fill.r != undefined
		context.fillStyle =
			"rgb(" + fill.r + "," + fill.g + "," + fill.b + ")"

		context.fillRect object.x, object.y, object.width, object.height
	else
		context.drawImage fill, object.x, object.y, object.width, object.height;

window.setup = () ->
	renderer.width = 1920
	renderer.height = 1080

	renderer.style.width = "1920px"
	renderer.style.height = "1080px"
