extends Node2D

var width
var height
var rand_num

# Called when the node enters the scene tree for the first time.
func _ready():
	var tree_types = $TreeBurning.sprite_frames.get_animation_names()
	$TreeBurning.play(tree_types[randi() % tree_types.size()])

	$'.'.position.y = width
	$'.'.position.x = height

func passData(width_pass, height_pass):
	width = width_pass
	height = height_pass

# dele
func _on_tree_burning_animation_looped():
	$TreeBurning.queue_free()
	pass # Replace with function body.
