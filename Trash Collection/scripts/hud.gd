extends CanvasLayer
signal start_game
signal end_game
var countdown = 3

func show_message(text): # provide text for argument!
	$Message.text = text
	$Message.show()
#	$"MessageTimer".start()

func _on_take_yer_marks_timeout():
	countdown -= 1
	if countdown != 0:
		show_message(str(countdown))
		$Timer.start()
	else:
		start_game.emit()
	
func _on_countdown_timeout():
	end_game.emit()
	show_message("Time's up! ")
	
	# add code to return to main page? 
	
func update_score(score):
	$Score.text = "Score: " + str(score)


# boilerplate i'm scared to delete

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

