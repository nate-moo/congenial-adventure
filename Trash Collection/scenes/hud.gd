extends CanvasLayer
signal start_game
var countdown = 3

func show_message(text):
	$"Message".text = text
	$"Message".show()
	$"MessageTimer".start()

func _on_take_yer_marks_timeout():
	countdown -= 1
	if countdown != 0:
		$Message.text = str(countdown)
		$Message.show()
		$Timer.start()
	else:
		pass #add code for starting game here
	
func _on_countdown_timeout():
	show_message("Time's up! ")
#	await $"MessageTimer".timeout
	
	$Message.text = "Here's your score. "
	$Message.show()
	# short timer before next action
	#await get_tree().create_timer(1.0).timeout
	#$Message.text = "temporary message"
	#$Message.show()
	
func update_score(score):
	$Score.text = "Score: " + str(score)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

