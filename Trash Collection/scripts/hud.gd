extends CanvasLayer

signal initiate_game
signal terminate_game
signal send_score # integrate with main!

var countdown = 3

func show_message(text): # allows for message to be different each time
	$Message.text = text
	$Message.show()
	$MessageTimer.start() # will appear for 3 seconds

func new_game(): # INTEGRATE WITH MAIN
	countdown -= 1
	if countdown != 0:
		show_message(str(countdown))
		$TakeYerMarks.start()
	else:
		initiate_game.emit() # need to link up with main

func _on_take_yer_marks_timeout():
	$Countdown.start()
	
func _on_countdown_timeout():
	terminate_game.emit() # end
	show_message("Time's up! ")
	
	# add code to return to main page? 
	
func update_score(score):
	$Score.text = str(score)
	send_score.emit() # lets main know what score is

# boilerplate i'm scared to delete

func _ready():
	new_game()
	pass # Replace with function body.

func _process(delta):
	pass
#	update_score($"../Score_Timer")

