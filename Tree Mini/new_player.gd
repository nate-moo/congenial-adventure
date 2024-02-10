extends Area2D
signal hit
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var angular_speed = PI
var screen_size_original
var character_size
@export var shape_scale_factor_x = 1.6
@export var shape_scale_factor_y = 3.4

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size_original = get_viewport_rect().size
	screen_size = screen_size_original
	
	# X scaling
	character_size = $CollisionShape2D.shape.get_rect().size.x * shape_scale_factor_x
	screen_size.x -= character_size
	
	# Y scaling
	character_size = $CollisionShape2D.shape.get_rect().size.y * shape_scale_factor_y
	screen_size.y -= character_size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("tree_player_left"):
		velocity.x -= 1
	if Input.is_action_pressed("tree_player_right"):
		velocity.x += 1
	if Input.is_action_pressed("tree_player_foreward"):
		velocity.y -= 1
	if Input.is_action_pressed("tree_player_back"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$CollisionShape2D/BlowtorchPlayer.play()
	else:
		$CollisionShape2D/BlowtorchPlayer.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	


func _on_body_entered(body):
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
