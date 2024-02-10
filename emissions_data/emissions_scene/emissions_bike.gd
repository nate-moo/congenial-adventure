extends Node2D

@export var emission_y_pos = 550
var width
var offset
var rand_num

func passData(width_pass, offset_pass, rng, ):
	width = width_pass
	offset = offset_pass
	rand_num = rng
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var scaled = rand_num
	$'.'.position.y = emission_y_pos
	$'.'.position.x = rand_num
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



