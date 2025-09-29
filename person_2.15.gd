extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -600.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var Coin = 0 

var Health = 10

func ApplyDMG(dmg :int):
	Health -= dmg
	
	if Health <= 0:
		Health = 0
	get_tree().reload_current_scene()

#func _process(delta):
	#print(Coin)

func flip_h(flip: bool) -> void:
	
	if flip:
		$Sprite2D.scale.x = -abs($Sprite2D.scale.x)
	else:
		$Sprite2D.scale.x = abs($Sprite2D.scale.x)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("Player_2.15_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
   
	var direction = Input.get_axis("Player_2.15_left","Player_2.15_right")
	if direction:
		velocity.x = direction * SPEED
		flip_h(direction < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		flip_h(false)
		
	if Input.is_action_just_pressed("Player_2.15_hold_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * 1.5
		
	if Input.is_action_just_pressed("Game_resest"):
		get_tree().reload_current_scene()
		
	if Input.is_action_pressed("Player_2.15_sprint"):
		velocity.x = SPEED * (2 if Input.is_action_pressed("Player_run") else 1)
	
	move_and_slide()

func _on_portal_17_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_18.tscn")

func _on_portal_18_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_21.tscn")

func _on_portal_21_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_22.tscn")

func _on_portal_22_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_25.tscn")

func _on_portal_25_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_26.tscn")

func _on_portal_26_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_27.tscn")

func _on_portal_27_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_30.tscn")

func _on_portal_30_body_entered(_body):
	get_tree().change_scene_to_file("res://CREDITS/GodotCredits.tscn")
