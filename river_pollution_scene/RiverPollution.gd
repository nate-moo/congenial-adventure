extends Node2D
var tire
var not_dead
var poison_dmg = 20
var delta_total = 0

func _ready():
	tire = load("res://river_pollution_scene/garbage.tscn")
	set_death()
	print(poison_dmg)
	#print(not_dead)
	
func set_camera_limits():
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	
func set_death():
	not_dead = true
	
func get_poison():
	print(poison_dmg)
	return poison_dmg
	
func _process(delta):
	#if 
	#set_death()
	delta_total += delta
	if (delta_total >= 1):
		delta_total = 0
	#await get_tree().create_timer(1.0).timeout
		#var tire_insta = tire.instantiate()
	#while (not_dead):
	#await get_tree().create_timer(1.0).timeout
		#get_parent().add_child(tire_insta)
	
	
