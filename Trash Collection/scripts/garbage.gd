extends RigidBody2D
signal screen_exited
#signal collected # should be handled by player

func _ready():
	var trash_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(trash_types[randi() % trash_types.size()])
	#var velocity = Vector2.ZERO # trash movement vector?

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # if implementing litterer?

#func _on_Garbage_body_entered(body): #might be an area function
	#hide()
##	collected.emit() # disabled since player (theoretically) handles collisions
	#$CollisionShape2D.set_deferred("disabled", true)

#func _on_collected():
	#pass # Replace with function body.	
	
#keeping just in case needed
func _process(delta):
	pass


