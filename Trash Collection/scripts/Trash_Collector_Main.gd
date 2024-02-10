extends Node
@export var trash_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# start timers for game
func _on_start_timer_timeout():
	$Trash_Timer.start()
	$Score_Timer.start()
	
# get all game variables set up
func new_game():
	score = 0
	$Player_Collector.start($Start_Position.position)
	$Start_Timer.start()
	
#update score whenever player collects a piece of trash
func _on_player_collector_collect_trash():
	score += 1
	
#func add_point():
	#score +=1
# may need rearranging for other character to get points?

# generating trash from timer
func _on_trash_timer_timeout():
	# new piece of garbage
	var trash = trash_scene.instantiate()
	
	#random location on path2d
	var trash_spawn_location = $Trash_Path/Trash_Spawn_Area
	trash_spawn_location.progress_ratio = randf()
	
	#direction normal to path direction?
	var direction = trash_spawn_location.rotation + PI/2
	
	#actually choosing the random location
	trash.position = trash_spawn_location.position
	
	#add slight rotation?
	direction += randf_range(-PI / 6, PI / 6)
	trash.rotation = direction
	
	#velpcity go whoo
	var velocity = Vector2(randf_range(125.0, 175.0), 0.0)
	trash.linear_velocity = velocity.rotated(direction)
	
	#generate trash (no problemo)
	add_child(trash)
	


func _on_score_timer_timeout():
	pass # Replace with function body.
