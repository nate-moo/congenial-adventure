extends Area2D
signal hit
@export var speed = 400
var screen_size
var angular_speed = PI
var screen_size_original
var character_size
@export var shape_scale_factor_x = 1.6
@export var shape_scale_factor_y = 3.4

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
	$"CollisionShape2D/Fire blowtorch".play("No Space")
	if Input.is_action_pressed("tree_player_left"):
		velocity.x -= 1
		$CollisionShape2D/Blowtorch.play("Walk left")
	if Input.is_action_pressed("tree_player_right"):
		velocity.x += 1
		$CollisionShape2D/Blowtorch.play("Walk right")
	if Input.is_action_pressed("tree_player_foreward"):
		velocity.y -= 1
	if Input.is_action_pressed("tree_player_back"):
		velocity.y += 1
	
	if (Input.is_action_pressed("BlowTorch") && velocity.x == -1):
		$"CollisionShape2D/Fire blowtorch".play("Walk left")
		$CollisionShape2D/BlowtorchPlayer/Area2D2/CollisionShape2D3.disabled = false
		$CollisionShape2D/BlowtorchPlayer/Area2D/CollisionShape2D2.disabled = true
	elif (Input.is_action_pressed("BlowTorch") && velocity.x == 1):
		$"CollisionShape2D/Fire blowtorch".play("Walk right")
		$CollisionShape2D/BlowtorchPlayer/Area2D2/CollisionShape2D3.disabled = true
		$CollisionShape2D/BlowtorchPlayer/Area2D/CollisionShape2D2.disabled = false
	elif (Input.is_action_pressed("BlowTorch") && velocity.y == -1):
		$"CollisionShape2D/Fire blowtorch".play("Walk left")
		$CollisionShape2D/BlowtorchPlayer/Area2D2/CollisionShape2D3.disabled = false
		$CollisionShape2D/BlowtorchPlayer/Area2D/CollisionShape2D2.disabled = true
	elif (Input.is_action_pressed("BlowTorch") && velocity.y == 1):
		$"CollisionShape2D/Fire blowtorch".play("Walk right")
	elif (Input.is_action_pressed("BlowTorch")):
		$CollisionShape2D/BlowtorchPlayer/Area2D2/CollisionShape2D3.disabled = true
		$CollisionShape2D/BlowtorchPlayer/Area2D/CollisionShape2D2.disabled = false
		$"CollisionShape2D/Fire blowtorch".play("Walk right")

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
