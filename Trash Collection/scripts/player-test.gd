extends Area2D
signal collect_trash #defines new signal 

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_body_entered(body):
	collect_trash.emit()

@export var speed = 500 # pixels/sec
var screen_size 

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide() # check that there's a condition to reappear!

# $ is shorthand for get_node("item").action() at the 
# relative current path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	velocity = velocity.normalized() * speed
	$AnimatedSprite2D.play()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO,screen_size)


