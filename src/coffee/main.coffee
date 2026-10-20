window.setup()

a = 0
while(a < 60)
	window.render window.objectA, window.colorA
	a++

if (window.scene == 0)
	window.menuHandler()

	console.log "a"
