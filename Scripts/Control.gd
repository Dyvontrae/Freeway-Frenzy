extends Control

func _on_StartButton_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_ResumeButton_pressed():
	hide()
	get_tree().paused = false

func _on_QuitButton_pressed():
	get_tree().quit()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			_on_ResumeButton_pressed()
		else:
			get_tree().paused = true
			show()


func _on_start_button_pressed():
	pass # Replace with function body.


func _on_resume_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	pass # Replace with function body.
