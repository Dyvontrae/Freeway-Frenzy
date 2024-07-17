extends CharacterBody2D

var speed = 260
var lane_width = 100

func _ready():
	print("PlayerCar loaded")
	position = Vector2(get_viewport().size.x / 2, get_viewport().size.y * 2/3)

func _physics_process(delta):
	var parallax = get_node("../ParallaxBackground")
	
	if Input.is_action_pressed("ui_left"):
		parallax.scroll_offset.x += speed * delta
	elif Input.is_action_pressed("ui_right"):
		parallax.scroll_offset.x -= speed * delta
	
	# Lane changing
	if Input.is_action_just_pressed("ui_up"):
		position.y -= lane_width
	elif Input.is_action_just_pressed("ui_down"):
		position.y += lane_width
	
	# Clamp vertical position
	position.y = clamp(position.y, get_viewport().size.y / 2, get_viewport().size.y - 50)

var score = 0

func increase_score(amount):
	score += amount
	get_node("/root/Main/HUD").update_score(score)
