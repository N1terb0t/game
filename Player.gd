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

@warning_ignore("unused_parameter")
func _process(delta):
	print(Coin)

func flip_h(flip: bool) -> void:
	
	if flip:
		$AnimatedSprite2D.scale.x = -abs($AnimatedSprite2D.scale.x)
	else:
		$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("Player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
   
	var direction = Input.get_axis("Player_left","Player_right")
	if direction:
		velocity.x = direction * SPEED
		flip_h(direction < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		flip_h(false)
		
	if Input.is_action_just_pressed("Player_hold jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * 1.5
		
	if Input.is_action_just_pressed("Game_resest"):
		get_tree().reload_current_scene()
		
	if Input.is_action_pressed("Player_sprint"):
		velocity.x = SPEED * (2 if Input.is_action_pressed("Player_run") else 1)
		
	move_and_slide()

func _on_portal_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_2.tscn")

func _on_portal_2_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_3.tscn")
	
func _on_portal_3_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_3_2.tscn")

func _on_portal_3_2_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_5.tscn")

func _on_portal_5_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_7.tscn")

func _on_portal_7_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_8.tscn")

func _on_portal_8_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_11.tscn")

func _on_portal_11_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_13.tscn")

func _on_portal_13_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_14.tscn")

func _on_portal_14_body_entered(_body):
	get_tree().change_scene_to_file("res://Maps/map_17.tscn")

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
