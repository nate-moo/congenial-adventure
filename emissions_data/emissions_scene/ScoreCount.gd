extends Label

signal score_updated(score_updated, new_score)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var emissionNode = get_tree().get_root().get_parent()
	#emissionNode.connect("score_up", _on_score_up)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_score(new_score):
	pass
	
func _on_score_up():
	print("Recieved score_up")
	$'.'.text += 1
