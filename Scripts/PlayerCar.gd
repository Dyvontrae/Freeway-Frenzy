extends CharacterBody2D

var speed = 300
var lane_width = 100
var current_lane = 1
var num_lanes = 3

func _ready():
	print("PlayerCar ready")
	set_position_to_lane()

func _input(event):
	if event.is_action_pressed("move_left"):
		print("Move left pressed")
		current_lane = max(0, current_lane - 1)
		set_position_to_lane()
	elif event.is_action_pressed("move_right"):
		print("Move right pressed")
		current_lane = min(num_lanes - 1, current_lane + 1)
		set_position_to_lane()

func set_position_to_lane():
	var viewport_size = get_viewport().size
	position.x = lane_width * current_lane + (viewport_size.x - lane_width * num_lanes) / 2
	print("Player position: ", position)
