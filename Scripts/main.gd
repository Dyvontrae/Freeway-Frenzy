extends Node

var level1_scene = preload("res://Levels/Level1.tscn")
var start_menu_scene = preload("res://Scenes/StartMenu.tscn")
var pause_menu_scene = preload("res://Scenes/PauseMenu.tscn")
var hud_scene = preload("res://Scenes/HUD.tscn")  # Add this line
var current_level = null
var start_menu = null
var pause_menu = null
var hud = null  # Add this line

func _ready():
	create_start_menu()

func create_start_menu():
	start_menu = start_menu_scene.instantiate()
	add_child(start_menu)
	start_menu.connect("start_game", Callable(self, "on_start_game"))

  # Ensure the start menu uses the full viewport
	start_menu.set_anchors_and_offsets_preset(Control.PRESET_CENTER)

func create_pause_menu():
	pause_menu = pause_menu_scene.instantiate()
	add_child(pause_menu)
	pause_menu.hide()

func on_start_game():
	if start_menu:
		start_menu.queue_free()
	
	if current_level:
		current_level.queue_free()
	
	current_level = level1_scene.instantiate()
	add_child(current_level)
	
	create_pause_menu()

	# Ensure only one player car is spawned
	var player_car_scene = preload("res://Scenes/player_car.tscn").instantiate()
	current_level.add_child(player_car_scene)
	player_car_scene.position = Vector2(100, 100)  # Adjust the starting position if necessary

	# Create and add HUD
	hud = hud_scene.instantiate()
	add_child(hud)
	
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
