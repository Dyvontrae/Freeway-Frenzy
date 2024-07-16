# Main.gd
extends Node2D

var current_level

func _ready():
	print("Main scene loaded")
	load_level("Level1")

func load_level(level_name):
	if current_level:
		current_level.queue_free()
	current_level = load("res://Levels/" + level_name + ".tscn").instantiate()
	add_child(current_level)
	print("Level added to scene tree")

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
