extends Area2D



func _on_body_entered(body):
	
	if body.name == "Player":
		body.ApplyDMG(10)
		
	if body.name == "person_2.15":
		body.ApplyDMG(10)
