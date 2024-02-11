extends Label

var node
var dmg_show

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	node = get_parent().get_parent().get_poison()
	text = "Poison" + str(node)
	#pass
