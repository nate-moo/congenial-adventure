extends Node2D

var width
var height
var rand_num
var color
var score = 0
var score_label

func passData(width_pass, height_pass):
	width = width_pass
	height = height_pass

func _ready():
	score_label = $HUD/Score
	$'.'.position.y = width
	$'.'.position.x = height
	if (randi() % 2 == 0):
		$TreeBurning.play("Green")
		color = "green"
	elif (randi() % 2 == 1):
		$TreeBurning.play("Orange")
		color = "orange"
	$"Fire Sounds".play()

func _on_tree_burning_animation_looped():
	if ($TreeBurning.animation == "Green Burn" or $TreeBurning.animation == "Orange Burn"):
		$TreeBurning.queue_free()
		score_label += 1

func _on_area_2d_2_area_entered(area):
	if self.get_parent() != area.get_parent():
		if (color == "green"):
			$TreeBurning.play("Green Burn")
		if (color == "orange"):
			$TreeBurning.play("Orange Burn")
