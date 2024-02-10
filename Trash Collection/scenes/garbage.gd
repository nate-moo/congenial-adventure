extends Area2D

signal screen_exited
signal collected

# Called when the node enters the scene tree for the first time.
func _ready():
	var trash_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(trash_types[randi() % trash_types.size()])


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_Garbage_body_entered(body):
	hide()
	collected.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
#keeping just in case needed
func _process(delta):
	pass
