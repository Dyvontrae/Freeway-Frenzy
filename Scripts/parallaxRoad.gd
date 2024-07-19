extends ParallaxBackground

var scroll_speed = 100

func _ready():
	scale_background()

func _process(delta):
	for layer in get_children():
		if layer is ParallaxLayer:
			layer.motion_offset.y += scroll_speed * delta

func scale_background():
	var viewport_size = get_viewport().size
	for layer in get_children():
		if layer is ParallaxLayer:
			var sprite = layer.get_node("Road")
			if sprite:
				var texture_size = sprite.texture.get_size()
				var scale_factor = viewport_size.x / texture_size.x
				sprite.scale = Vector2(scale_factor, scale_factor)
				layer.motion_mirroring.y = texture_size.y * scale_factor
