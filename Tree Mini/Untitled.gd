extends Sprite2D
var speed = 400
var angular_speed = PI

#fun _ready():
	#pass

func _process(delta):
	#var direction = 0
	#if Input.is_action_pressed("tree_player_left"):
		#direction = -1
	#if Input.is_action_pressed("tree_player_right"):
		#direction = 1
		
	#rotation += angular_speed * direction * delta
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("tree_player_foreward"):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("tree_player_back"):
		velocity = Vector2.DOWN.rotated(rotation) * speed
	if Input.is_action_pressed("tree_player_left"):
		velocity = Vector2.LEFT.rotated(rotation) * speed
	if Input.is_action_pressed("tree_player_right"):
		velocity = Vector2.RIGHT.rotated(rotation) * speed
	position += velocity * delta
	

