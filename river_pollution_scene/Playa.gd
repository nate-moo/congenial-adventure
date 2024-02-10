extends CharacterBody2D

const GRAVITY = 100.0
const WALK_SPEED = 200
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#print(delta)
	#velocity.y += delta * gravity
	velocity.y += 0 if is_on_floor() else delta * gravity
	
	print(position.y)
	print(is_on_floor())
	
	#if (position.y > 202.4):
		#position.y -= 2

	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	if Input.is_action_pressed("move_right"):
		velocity.x =  WALK_SPEED
	if Input.is_action_pressed("fish_jump"):
		velocity.y -= 100
	#else:
		#velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
