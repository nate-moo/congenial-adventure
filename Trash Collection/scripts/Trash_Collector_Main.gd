extends Node # for trash movement
@export var trash_scene: PackedScene
var score

# Process to generate trash
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
	# velocity = velocity.normalized() # * speed (former modifier for player)
	
	#generate trash (no problemo)
	add_child(trash)

# Starting and stopping rounds
func new_game():
	score = 0
	$Player_Collector.start($Start_Position.position) # initiate player
	$Countdown.start() # 3 second timer before going into game

func end_game(): 
	$Trash_Timer.stop()  # stop generating trash
	# get score from HUD
	

# 3 second timer before official game countdown and trash generation 
func _on_start_timer_timeout():
	$Trash_Timer.start()
	$Time_Limit.start() # CURRENTLY SET TO 10s FOR TESTING - CHANGE!!!!!!

# Stop game when timer runs out
func _on_Time_Limit_timeout():
	end_game()
	
#update score whenever player collects a piece of trash
func _on_player_collector_collect_trash():
	score += 1
	
#func add_point():
	#score +=1
# may need rearranging for other character to get points?
	
func _ready():
	pass
	#new_game() # may need to be replaced with pass once everything's working (unlikely)

func _process(delta):
	pass
	# update score constantly?



