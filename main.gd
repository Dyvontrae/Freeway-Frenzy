extends Node

var level1_scene = preload("res://Levels/level1.tscn")
var start_menu_scene = preload("res://Scenes/StartMenu.tscn")
var pause_menu_scene = preload("res://Scenes/PauseMenu.tscn")

var current_level = null
var start_menu = null
var pause_menu = null

func _ready():
	create_start_menu()

func create_start_menu():
	start_menu = start_menu_scene.instantiate()
	add_child(start_menu)
	start_menu.connect("start_game", Callable(self, "on_start_game"))

func create_pause_menu():
	pause_menu = pause_menu_scene.instantiate()
	add_child(pause_menu)
	pause_menu.hide()

func on_start_game():
	if start_menu:
		start_menu.queue_free()
	
	current_level = level1_scene.instantiate()
	add_child(current_level)
	
	create_pause_menu()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") or event.is_action_pressed("pause"):
		if not start_menu:
			toggle_pause()

func toggle_pause():
	if not pause_menu:
		print("PauseMenu not found")
		return
	
	if get_tree().paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		pause_menu.show()
		get_tree().paused = true
