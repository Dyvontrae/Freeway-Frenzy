extends CharacterBody2D

var speed = 300
var lane_width = 100
var current_lane = 1
var num_lanes = 3

func _ready():
	print("PlayerCar ready")

func _physics_process(delta):
	var target_velocity = Vector2.ZERO
	
	if Input.is_action_just_pressed("move_left"):
		print("Move left pressed")
		current_lane = max(0, current_lane - 1)
	elif Input.is_action_just_pressed("move_right"):
		print("Move right pressed")
		current_lane = min(num_lanes - 1, current_lane + 1)
	
	var viewport_size = get_viewport().size
	var target_x = lane_width * current_lane + (viewport_size.x - lane_width * num_lanes) / 2
	target_velocity.x = (target_x - position.x) * 10
	
	velocity = target_velocity
	move_and_slide()
	print("Player position: ", position)
