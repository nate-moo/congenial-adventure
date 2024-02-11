extends CollisionShape2D

@export var spawn_delay = 0.5
@export var bike_max = 20

var rng = RandomNumberGenerator.new()
var delta_total = 0
var bike_count = 0
var bike
var width
var offset
var rand

# Called when the node enters the scene tree for the first time.
func _ready():
	bike = load("res://emissions_data/emissions_bike.tscn")
	width = $'.'.shape.get_rect().size.x
	offset = $'.'.shape.get_rect().position.x
	rng.randomize()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta_total += delta
	# Check time passed for time based spawning
	if (delta_total >= spawn_delay && bike_count < bike_max):
		delta_total = 0
		
		var bike_instance = bike.instantiate()
		rand = rng.randf_range(width + offset, width * 1.5)
		
		bike_instance.passData(width, offset, rand)
		get_parent().add_sibling(bike_instance)
	pass


func _on_timer_2_timeout():
	$'.'.queue_free()
	get_tree().call_group("emissions_bike", "queue_free")
	
	pass # Replace with function body.
