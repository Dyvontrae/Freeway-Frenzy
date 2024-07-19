extends Control

@onready var resume_button = $MarginContainer/VBoxContainer/ResumeButton
@onready var quit_button = $MarginContainer/VBoxContainer/QuitButton

func _ready():
	print("PauseMenu ready")
	if resume_button and quit_button:
		resume_button.connect("pressed", Callable(self, "_on_ResumeButton_pressed"))
		quit_button.connect("pressed", Callable(self, "_on_QuitButton_pressed"))
	else:
		print("Error: Buttons not found in PauseMenu")

func _on_ResumeButton_pressed():
	print("Resume button pressed")
	hide()
	get_tree().paused = false

func _on_QuitButton_pressed():
	print("Quit button pressed")
	get_tree().quit()
