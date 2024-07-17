extends Node2D

var player = null  # Track the player instance

func _ready():
	print("Level1 scene loaded")
	spawn_player()

func spawn_player():
	if player:
		player.queue_free()  # Remove the previous instance if it exists

	player = preload("res://Scenes/player_car.tscn").instantiate()
	player.position = Vector2(100, 100)
	add_child(player)
	print("Player added to scene tree")
	
	# Set up the camera
	var camera = $Camera2D
	camera.make_current()  # Use this instead of camera.current = true
	camera.position = Vector2(get_viewport().size.x / 2, get_viewport().size.y * 2/3)
	camera.drag_horizontal_enabled = false
	camera.drag_vertical_enabled = false
