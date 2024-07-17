extends ParallaxBackground

var scroll_speed = 100

func _process(delta):
	# Move the ParallaxLayer downwards
	for layer in get_children():
		if layer is ParallaxLayer:
			layer.motion_offset.y += scroll_speed * delta
	
