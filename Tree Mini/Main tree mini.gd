extends Node

@export var tree_scene: PackedScene
@export var spawn_delay = 0.5
var score
var treeCount = 0
var rng = RandomNumberGenerator.new()
var delta_total = 0
var tree
var width
var offset
var rand

# Called when the node enters the scene tree for the first time.
func _ready():
	tree = load("res://Tree Mini/Orange Tree Sprite.gd")
	width = $'.'.shape.get_rect().size.x
	offset = $'.'.shape.get_rect().position.x
	rng.randomize()


func _process(delta):
	delta_total += delta
	# Check time passed for time based spawning
	if (delta_total >= spawn_delay):
		delta_total = 0
		var tree_instance = tree.instantiate()
		rand = rng.randf_range(width + offset, width * 1.5)
		
		tree_instance.passData(width, offset, rand)
		get_parent().add_sibling(tree_instance)

	###Old code from tutorial

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

