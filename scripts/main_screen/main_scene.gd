extends Node

var minigames_scene = preload("res://minigames_scene.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	$StaireWarning
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	get_tree().change_scene_to_file("res://minigames_scene.tscn")
	pass # Replace with function body.


func _on_staire_warning_canceled():
	get_tree().quit()
	pass # Replace with function body.
