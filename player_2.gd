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

func _process(delta):
	print(Coin)

func flip_h(flip: bool) -> void:
	
	if flip:
		$Person_red.scale.x = -abs($Person_red.scale.x)
	else:
		$Person_red.scale.x = abs($Person_red.scale.x)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("player_2_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
   
	var direction = Input.get_axis("player_2_left","player_2_right")
	if direction:
		velocity.x = direction * SPEED
		flip_h(direction < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		flip_h(false)
		
	if Input.is_action_just_pressed("player_2_hold_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * 1.5
		
	if Input.is_action_just_pressed("Game_resest"):
		get_tree().reload_current_scene()
		
	if Input.is_action_pressed("player_2_sprint"):
		velocity.x = SPEED * (2 if Input.is_action_pressed("player_2_run") else 1)
		
	move_and_slide()
