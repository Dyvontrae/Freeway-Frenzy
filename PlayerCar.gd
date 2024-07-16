extends CharacterBody2D

var speed = 260

func _ready():
	print("PlayerCar loaded")

func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
		
	velocity = input_vector.normalized() * speed
	move_and_slide()

	
#declaring score variable for scoring functionality	
var score = 0
#increasing score functionality
func increase_score(amount):
	score += amount
	get_node("/root/Main/HUD").update_score(score)
