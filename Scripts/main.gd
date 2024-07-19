extends Node

# Declare scenes for all features in the game
var level1_scene = preload("res://Levels/Level1.tscn")
var start_menu_scene = preload("res://Scenes/StartMenu.tscn")
var pause_menu_scene = preload("res://Scenes/PauseMenu.tscn")
var hud_scene = preload("res://Scenes/HUD.tscn")
var player_car_scene = preload("res://Scenes/player_car.tscn")

var current_level = null
var start_menu = null
var pause_menu = null
var hud = null

func _ready():
	get_tree().set_auto_accept_quit(false)
	get_viewport().connect("size_changed", Callable(self, "_on_viewport_size_changed"))
	_on_viewport_size_changed()
	#scaling to viewport
	print("Main scene ready")
	create_start_menu()
func _on_viewport_size_changed():
	var viewport_size = get_viewport().size
	# Adjust any necessary elements based on the new viewport size
	if current_level:
		current_level.position = Vector2(viewport_size.x / 2, 0)
	if hud:
		# Reposition HUD elements if needed
		pass

func create_start_menu():
	print("Creating start menu")
	if start_menu:
		start_menu.queue_free()
	start_menu = start_menu_scene.instantiate()
	add_child(start_menu)
	start_menu.connect("start_game", Callable(self, "on_start_game"))
	
 # Force full-screen size
	start_menu.anchor_right = 1
	start_menu.anchor_bottom = 1
	start_menu.offset_right = 0
	start_menu.offset_bottom = 0
	
	print("Start Menu created")
	print("Start menu child count:", start_menu.get_child_count())


func create_pause_menu():
	print("Creating pause menu")
	if pause_menu:
		pause_menu.queue_free()
	pause_menu = pause_menu_scene.instantiate()
	add_child(pause_menu)
	pause_menu.hide()
	print("Pause Menu created")
	print("Pause menu child count:", pause_menu.get_child_count())

func on_start_game():
	print("Starting game")
	if start_menu:
		start_menu.queue_free()
		start_menu = null
	
	if current_level:
		current_level.queue_free()
	
	current_level = level1_scene.instantiate()
	add_child(current_level)
	print("Level1 loaded")
	
	create_pause_menu()
	
	# Ensure the level is positioned correctly 
	if current_level is Node2D: 
		current_level.position = Vector2.ZERO
	
	var player_car = player_car_scene.instantiate()
	current_level.add_child(player_car)
	player_car.position = Vector2(100, 100)  # Adjust the starting position if necessary
	print("Player Car added")
	
	hud = hud_scene.instantiate()
	add_child(hud)
	print("HUD created")
	print("HUD child count:", hud.get_child_count())

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") or event.is_action_pressed("Pause"): #attempting to close game or bring up pause menu
		print("Escape Key Pressed")
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
	print("Pause Toggled: ", get_tree().paused)


func _on_start_menu_start_game():
	pass # Replace with function body.
