extends Node

@export var tree_scene: PackedScene
@export var spawn_delay = 0.5
var treeCount = 0
var rng = RandomNumberGenerator.new()
var delta_total = 0
var tree
var width
var offset
var rand
var score

func _ready():
	#$"Fire Sounds".play()
	pass


	
func _on_fire_sounds_finished():
	$"Fire Sounds".play()

func _process(delta):
	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
	
func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

