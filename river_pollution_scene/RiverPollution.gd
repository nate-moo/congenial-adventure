extends CharacterBody2D

var speed = 400
var angular_speed = PI
func _init():
	print("this suck buns")

func _process(delta):
	#rotation += angular_speed * delta

	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
	#position += velocity * delta
		velocity.x += 1.0
	if Input.is_action_pressed("ui_left"):
	#position += velocity * delta
		velocity.x -= 1.0
		
	move_and_collide(Vector2(0, 1))
	
