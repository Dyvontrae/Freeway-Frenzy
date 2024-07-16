# Barrier.gd
extends StaticBody2D

#variable declarations
var required_shots = 5
var required_players = 1

func take_damage():
	required_shots -= 1
	if required_shots <= 0:
		queue_free()

func _on_PlayerDetector_body_entered(body):
	if body.is_in_group("player"):
		required_players -= 1
		if required_players <= 0:
			queue_free()
