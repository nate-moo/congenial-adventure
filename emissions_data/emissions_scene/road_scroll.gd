extends Sprite2D

var pos
# Called when the node enters the scene tree for the first time.
func _ready():
	pos = $".".position
	#pos = $"Seamless-road-texture2".position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".position.y += 7.5
	#print($".".position.y)
	if ($".".position.y > 200):
		$".".position.y = -230

	pass
