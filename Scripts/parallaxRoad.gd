extends ParallaxBackground

var scroll_speed = 100

func _ready():
	scale_background()

func _process(delta):
	for child in get_children():
		if child is ParallaxLayer:
			child.motion_offset.y += scroll_speed * delta
			if child.motion_offset.y >= child.motion_mirroring.y:
				child.motion_offset.y = 0

func scale_background():
	var viewport_size = get_viewport().size
	for child in get_children():
		if child is ParallaxLayer:
			var sprite = child.get_node("Road")
			if sprite:
				var texture_size = sprite.texture.get_size()
				var scale_factor = viewport_size.x / texture_size.x
				sprite.scale = Vector2(scale_factor, scale_factor)
				child.motion_mirroring.y = texture_size.y * scale_factor
