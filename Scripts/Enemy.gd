# Enemy.gd
extends CharacterBody2D

var speed = 100
var hp = 1

var target

func _physics_process(delta):
	if target:
		var direction = (target.global_position - global_position).normalized()
		move_and_slide(direction * speed)

func take_damage():
	hp -= 1
	if hp <= 0:
		queue_free()

func _on_DetectionArea_body_entered(body):
	if body.is_in_group("player"):
		target = body
