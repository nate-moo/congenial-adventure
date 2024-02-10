extends CollisionShape2D

@export var spawn_delay = 0

var rng = RandomNumberGenerator.new()
var delta_total = 0
var bike
var width
var offset
var rand

# Called when the node enters the scene tree for the first time.
func _ready():
	bike = load("res://emissions_data/emissions_bike.tscn")
	width = $'.'.shape.get_rect().size.x
	offset = $'.'.shape.get_rect().position.x
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta_total += delta_total
	if (delta_total >= spawn_delay):
		var bike_instance = bike.instantiate()
		rand = rng.randf_range(width + offset, width)
		bike_instance.passData(width, offset, rand)
		get_parent().add_sibling(bike_instance)
	pass
