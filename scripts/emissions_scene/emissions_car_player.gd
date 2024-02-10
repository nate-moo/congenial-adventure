extends Area2D

@export var player_speed = 400
var screen_size
var screen_size_original
var vehicle_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size_original = get_viewport_rect().size
	screen_size = screen_size_original
	
	vehicle_size = $CollisionShape2D.shape.get_rect().size.x
	screen_size.x -= vehicle_size
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("car_left"):
		velocity.x += -1
	if Input.is_action_pressed("car_right"):
		velocity.x += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * player_speed
	position += velocity * delta
	
	position = position.clamp(Vector2.ZERO, screen_size)
	pass
