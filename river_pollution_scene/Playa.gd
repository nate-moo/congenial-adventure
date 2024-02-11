extends CharacterBody2D
@export var shape_scale_factor = 0.6
var screen_size
var screen_size_original
var playa_size
const GRAVITY = 100.0
const WALK_SPEED = 200
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_avail

func _ready():
	print("Stayin' Alive")
	screen_size_original = get_viewport_rect().size
	#print(screen_size_original)
	screen_size = screen_size_original
	playa_size = $'CollisionShape2D'.shape.get_rect().size.y * shape_scale_factor
	#screen_size.x -= playa_size
	#position.x = position.clamp(Vector2(t[0]), Vector2(t[2][0],0))
	#position.y = position.clamp(Vector2.ZERO, end.y)
	#global_position = t.affine_inverse().xform(pos)
	
func _physics_process(delta):
	#position = position.clamp(Vector2.ZERO, screen_size)
	#var t = get_viewport_transform()
	#position = position.clamp(Vector2.ZERO, screen_size)
	#screen_size_original = get_viewport_rect().size
	#screen_size = screen_size_original
	#playa_size = $'CollisionShape2D'.shape.get_rect().size.y * shape_scale_factor
	#screen_size.x -= playa_size
	#position = position.clamp(Vector2.ZERO, screen_size)
	#var t = get_viewport_transform()
	#print(t)
	#var pos = t.xform(global_position)

	#position = position.clamp(Vector2.ZERO, Vector2.ZERO)
	#position = position.clamp(Vector2.ZERO, screen_size)
	#print(delta)
	#velocity.y += delta * gravity
	if is_on_floor() :
		velocity.y += 0 
		velocity.x *= 0.4
		jump_avail = 2
	else: 
		velocity.y = delta * (gravity*25)
	
	#print(position.y)
		
	
	#if (position.y > 202.4):
		#position.y -= 2

	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	if Input.is_action_pressed("move_right"):
		velocity.x =  WALK_SPEED
	if Input.is_action_pressed("fish_jump"):
		jump_avail -= 1
		velocity.y -= 750
		if Input.is_action_pressed("move_right"):
			velocity.x =  WALK_SPEED
		if Input.is_action_pressed("move_left"):
			velocity.x = -WALK_SPEED
	if Input.is_action_pressed("exit_back"):
		get_tree().change_scene_to_file("res://minigames_scene.tscn")
	#else:
		#velocity.x = 0
		

	# "move_and_slide" already takes delta time into account.
	move_and_slide()

