extends Control

func _ready():
	$VBoxContainer/ResumeButton.connect("pressed", Callable(self, "_on_ResumeButton_pressed"))
	$VBoxContainer/QuitButton.connect("pressed", Callable(self, "_on_QuitButton_pressed"))

func _on_ResumeButton_pressed():
	hide()
	get_tree().paused = false

func _on_QuitButton_pressed():
	get_tree().quit()
