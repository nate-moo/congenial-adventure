extends Node
@export var trash_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_timer_timeout():
	$Trash_Timer.start()
	$Score_Timer.start()

func new_game():
	score = 0
	$Player_Collector.start($Start_Position.position)
	$StartTimer.start()

func add_point():
	score +=1
	
func _on_trash_timer_timeout():
	# new piece of garbage
	var trash = trash_scene.instantiate()
	
	#random location on path2d
	var trash_spawn_location = $Trash_Path/Trash_Spawn
	trash_spawn_location.progress_ration = randf()
	
	#direction normal to path direction?
	var direction = trash_spawn_location.rotation + PI/2
	
	#actually choosing the random location
	trash.position = trash_spawn_location.position
	
	#yay random direction i guess
	direction += randf_range(-PI / 4, PI / 4)
	trash.rotation = direction
	
	#velpcity go whoo
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	trash.linear_velocity = velocity.rotated(direction)
	
	#generate trash (no problemo)
	add_child(trash)
	
