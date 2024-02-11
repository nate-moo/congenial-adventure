extends Area2D
signal collect_trash 

@export var speed = 1000 # pixels/sec
@export var shape_scale = 0.5
var screen_size # intended to keep player sprite within screen range
var player_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#player_size = $CollisionShape2D.shape.get_rect().size.y * shape_scale
	#screen_size.x -= player_size
	# in case of frame alignment

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO #player movement vector
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	velocity = velocity.normalized() * speed
	$AnimatedSprite2D.animation = "trash-idle"
	$AnimatedSprite2D.play()
		
	position += velocity * delta # changes per frame
	position.x = clamp(position.x, 0,screen_size.x) #from official github project, not tutorial

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false #collsions sohould be on!!

func _on_Player_Collector_body_entered(body):
	print("body entered ") #added underscore due to docs?
	collect_trash.emit()
	$AnimatedSprite2D.animation = "trash-happy"
	$AnimatedSprite2D.play()
	body.queue_free() # deletes object once collected
	#this might be an area function, check for later


func _on_body_entered(body):
	print("Body collided")
	pass # Replace with function body.
