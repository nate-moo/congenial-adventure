extends Area2D

var text_node
var cloud_pos
var self_pos
@export var emission_y_pos = 330
@export var emission_x_pos = 40
@export var car_speed = 7.5

signal score_up

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".position.y += car_speed
	pass

func passData(score_node):
	text_node = score_node

func _on_child_entered_tree(node):
	node.position.x = node.get_parent().get_parent().get_child(2).position.x + emission_x_pos
	node.position.y = emission_y_pos

	pass # Replace with function body.


func _on_area_entered(area):
	text_node.text = str(int(text_node.text) + 1)
	area.queue_free()
	pass # Replace with function body.
