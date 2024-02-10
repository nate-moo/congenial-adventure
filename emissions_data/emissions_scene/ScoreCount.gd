extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	#var emissionNode = %CollisionShape2D.get_parent()
	#emissionNode.connect("score_up", _on_score_up)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_score_up():
	print("Recieved score_up")
	$'.'.text += 1
