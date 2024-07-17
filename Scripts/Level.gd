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
	
	# Set the camera to follow the player
	var camera = $Camera2D
	camera.current = true
	camera.position = Vector2(0, 0)
