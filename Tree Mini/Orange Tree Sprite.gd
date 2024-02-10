extends Node2D

@export var emission_y_pos = 550
var width
var offset
var rand_num

# Called when the node enters the scene tree for the first time.
func _ready():
	var tree_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(tree_types[randi() % tree_types.size()])
	
	var scaled = rand_num
	$'.'.position.y = emission_y_pos
	$'.'.position.x = rand_num


func passData(width_pass, offset_pass, rng, ):
	width = width_pass
	offset = offset_pass
	rand_num = rng

