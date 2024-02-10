extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".position.y += 7.5
	pass


func _on_child_entered_tree(node):
	$'.'.position = get_parent().get_child(0).position
	pass # Replace with function body.
