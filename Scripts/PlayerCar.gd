extends CharacterBody2D

var speed = 260
var lane_width = 100  # Adjust based on the width of your lanes

func _ready():
	print("PlayerCar loaded")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		position.x -= lane_width
	elif Input.is_action_just_pressed("ui_right"):
		position.x += lane_width

	# Ensure the player stays within bounds (modify as needed)
	position.x = clamp(position.x, 0, lane_width * 2)  # Adjust based on the number of lanes

# Declaring score variable for scoring functionality
var score = 0

# Increasing score functionality
func increase_score(amount):
	score += amount
	get_node("/root/Main/HUD").update_score(score)
