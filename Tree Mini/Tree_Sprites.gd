extends Node2D

var width
var height
var rand_num
var color
#var current_tree = $TreeBurning

func passData(width_pass, height_pass):
	width = width_pass
	height = height_pass

func _ready():
	$'.'.position.y = width
	$'.'.position.x = height
	if (randi() % 2 == 0):
		$TreeBurning.play("Green")
		color = "green"
	elif (randi() % 2 == 1):
		$TreeBurning.play("Orange")
		color = "orange"

func _on_tree_burning_animation_looped():
	if ($TreeBurning.animation == "Green Burn" or $TreeBurning.animation == "Orange Burn"):
		$TreeBurning.queue_free()

func _on_area_2d_2_area_entered(area):
	if self.get_parent() != area.get_parent():
		if (color == "green"):
			$TreeBurning.play("Green Burn")
		if (color == "orange"):
			$TreeBurning.play("Orange Burn")

