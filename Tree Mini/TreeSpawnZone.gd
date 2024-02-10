extends CollisionShape2D

@export var spawn_delay = 0.5
#@export var tree_max = 20

var rng = RandomNumberGenerator.new()
var delta_total = 0
var bike_count = 0
var tree
var width
var height
var offset
var rand


# Called when the node enters the scene tree for the first time.
func _ready():
	tree = load("res://Tree Mini/Tree Sprites.tscn")
	width = $'.'.shape.get_rect().size.x
	height = $'.'.shape.get_rect().size.y + 300
	offset = $'.'.shape.get_rect().position.x
	

		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta_total += delta
	# Check time passed for time based spawning
	if (delta_total >= spawn_delay):
		rng.randomize()
		delta_total = 0
		
		var tree_instance = tree.instantiate()
		var rand_width = rng.randf_range(0, width)
		var rand_height = rng.randf_range(0, height)
		
		tree_instance.passData(rand_width, rand_height)
		get_parent().add_sibling(tree_instance)
	pass
