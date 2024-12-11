extends Control

signal start_game

@onready var margin_container = $MarginContainer
@onready var vbox_container = $MarginContainer/VBoxContainer
@onready var start_button = $MarginContainer/VBoxContainer/StartButton
@onready var quit_button = $MarginContainer/VBoxContainer/QuitButton

func _ready():
	print("StartMenu _ready called")
	call_deferred("_post_ready")

func _post_ready():
	print("StartMenu _post_ready called")
	if margin_container and vbox_container and start_button and quit_button:
		center_menu()
		connect_buttons()
	else:
		print("Error: Some nodes are missing in the StartMenu scene")
		if not margin_container:
			print("MarginContainer not found")
		if not vbox_container:
			print("VBoxContainer not found")
		if not start_button:
			print("StartButton not found")
		if not quit_button:
			print("QuitButton not found")

func center_menu():
	if margin_container:
		# Center the MarginContainer instead of VBoxContainer
		var viewport_size = get_viewport_rect().size
		var menu_size = margin_container.size
		margin_container.position = (viewport_size - menu_size) / 2
		margin_container.position.y = max(margin_container.position.y, 0)
	print("Menu centered")

func connect_buttons():
	if start_button and quit_button:
		if not start_button.is_connected("pressed", Callable(self, "_on_StartButton_pressed")):
			start_button.connect("pressed", Callable(self, "_on_StartButton_pressed"))
		if not quit_button.is_connected("pressed", Callable(self, "_on_QuitButton_pressed")):
			quit_button.connect("pressed", Callable(self, "_on_QuitButton_pressed"))
		print("Buttons connected")
	else:
		print("Error: Buttons not found")

func _on_StartButton_pressed():
	print("Start button pressed")
	emit_signal("start_game")
	
func _on_QuitButton_pressed():
	print("Quit button pressed")
	get_tree().quit()

# Add this function to check for input
func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Mouse click detected at: ", event.position)
	if event.is_action_pressed("ui_accept"):
		print("Enter key pressed")
		_on_StartButton_pressed()
	elif event.is_action_pressed("ui_cancel"):
		print("Escape key pressed")
		_on_QuitButton_pressed()
