extends Control

signal start_game

func _ready():
	$VBoxContainer/StartButton.connect("pressed", Callable(self, "_on_StartButton_pressed"))
	$VBoxContainer/QuitButton.connect("pressed", Callable(self, "_on_QuitButton_pressed"))

func _on_StartButton_pressed():
	emit_signal("start_game")

func _on_QuitButton_pressed():
	get_tree().quit()
