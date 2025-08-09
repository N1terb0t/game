extends Area2D



func _on_body_entered(body):
	
	if body.name == "Player_2_0":
		body.ApplyDMG(10)
	pass
