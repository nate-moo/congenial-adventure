extends Node2D
var tire
var poison_dmg = 30
var delta_total = 0
var lose

func _ready():
	tire = load("res://river_pollution_scene/garbage.tscn")
	#print(not_dead)
	
func set_camera_limits():
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	
	
func get_poison():
	return poison_dmg
	
func set_poison(poison):
	poison_dmg = poison
	
func _process(delta):
	#if 
	#set_death()
	delta_total += delta
	if (delta_total >= 1):
		delta_total = 0
	#await get_tree().create_timer(1.0).timeout
		var tire_insta = tire.instantiate()
	#while (not_dead):
	#await get_tree().create_timer(1.0).timeout
		$".".add_child(tire_insta)
		
	if (poison_dmg <= 0):
		print("Goodbye Fish.")
		get_tree().change_scene_to_file("res://minigames_scene.tscn")	
