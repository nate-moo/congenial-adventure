extends Node2D

@export var player_speed = 400
@export var emit_time = 0.25
@export var shape_scale_factor = 0.321
var screen_size
var screen_size_original
var vehicle_size
var emission
var delta_full = 0
var game_over = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	emission = load("res://emissions_data/emissions_car_emissions.tscn")
	
	screen_size_original = get_viewport_rect().size
	screen_size = screen_size_original
	
	vehicle_size = $'CollisionShape2D'.shape.get_rect().size.y * shape_scale_factor
	screen_size.x -= vehicle_size
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if (game_over == 0):
		var velocity = Vector2.ZERO
		delta_full += delta
		if Input.is_action_pressed("car_left"):
			velocity.x += -1
		if Input.is_action_pressed("car_right"):
			velocity.x += 1
		if Input.is_action_pressed("emit_fumes"):
			if (delta_full > emit_time):
				delta_full = 0
				var emission_instance = emission.instantiate()
				emission_instance.passData(get_parent().get_node('VBoxContainer/ScoreLabel/ScoreCount')) # VBoxContainer/ScoreLabel/ScoreCount
				get_parent().add_child(emission_instance)
		if velocity.length() > 0:
			velocity = velocity.normalized() * player_speed
		position += velocity * delta
		
		position = position.clamp(Vector2.ZERO, screen_size)
	else:
		await get_tree().create_timer(5.0).timeout
		get_tree().change_scene_to_file("res://emissions_data/emissions.tscn")
		
	pass


func _on_timer_2_timeout():
	game_over = 1
	pass # Replace with function body.
