extends CharacterBody2D
var speed = 200
func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	velocity = velocity.normalized() * speed
	move_and_slide()
	
	
