# Level1.gd
extends Node2D

func _ready():
	print("Level1 scene loaded")
	spawn_player()

func spawn_player():
	var player = preload("res://Scenes/player_car.tscn").instantiate()
	player.position = Vector2(100, 100)
	add_child(player)
	print("Player added to scene tree")
