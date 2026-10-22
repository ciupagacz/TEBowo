window.addEventListener "mousemove", (event) ->
	window.cursor.base.x = event.clientX - window.offsetX
	window.cursor.base.y = event.clientY - window.offsetY

window.addEventListener "click", (event) ->
	if window.collision window.cursor.base, window.start.TEBulinek
		window.start.animation = true
