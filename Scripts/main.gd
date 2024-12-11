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

# Called when the node is added to the scene
func _ready():
	# Prevent the game from quitting automatically
	get_tree().set_auto_accept_quit(false)
	# Connect the viewport size changed signal to a method
	get_viewport().connect("size_changed", Callable(self, "_on_viewport_size_changed"))
	_on_viewport_size_changed()
	print("Main scene ready")
	# Create the start menu
	create_start_menu()

# Called when the viewport size changes
func _on_viewport_size_changed():
	if current_level:
		current_level.position = Vector2(get_viewport().size.x / 2, 0)
	# Reposition HUD elements if needed
	if hud:
		pass

# Create and display the start menu
func create_start_menu():
	print("Creating start menu")
	if start_menu:
		start_menu.queue_free()
	start_menu = start_menu_scene.instantiate()
	add_child(start_menu)
	start_menu.connect("start_game", Callable(self, "on_start_game"))

	# Center the start menu after it's been added to the scene
	await get_tree().process_frame
	center_start_menu()

	print("Start Menu created")
	print("Start menu child count:", start_menu.get_child_count())

# Method to handle the start_game signal
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

	# Create and add HUD
	hud = hud_scene.instantiate()
	add_child(hud)

	# Create the pause menu
	create_pause_menu()

	# Ensure the level is centered
	_on_viewport_size_changed()

# Center the start menu in the viewport
func center_start_menu():
	if start_menu:
		var viewport_size = get_viewport().size
		var viewport_size_v2 = Vector2(viewport_size.x, viewport_size.y)

		# Assuming you can set size and position with existing methods
		start_menu.rect_min_size = Vector2(400, 300)

		# Center the start menu
		start_menu.rect_pivot_offset = start_menu.rect_min_size / 2
		start_menu.rect_position = viewport_size_v2 / 2

# Create and hide the pause menu
func create_pause_menu():
	print("Creating pause menu")
	if pause_menu:
		pause_menu.queue_free()
	pause_menu = pause_menu_scene.instantiate()
	add_child(pause_menu)
	pause_menu.hide()
	print("Pause Menu created")
	print("Pause menu child count:", pause_menu.get_child_count())

# Handle input events, such as pausing the game
func _input(event):
	if event.is_action_pressed("pause_game"):
		if get_tree().paused:
			resume_game()
		else:
			pause_game()

# Pause the game and show the pause menu
func pause_game():
	print("Pausing game")
	get_tree().paused = true
	if pause_menu:
		pause_menu.show()

# Resume the game and hide the pause menu
func resume_game():
	print("Resuming game")
	get_tree().paused = false
	if pause_menu:
		pause_menu.hide()
