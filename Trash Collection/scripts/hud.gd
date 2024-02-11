extends CanvasLayer

signal start_game

# Establish display system
func show_message(text): # allows for message to be different each time
	$Message.text = text
	$Message.show()
	$MessageTimer.start() # will appear for 3 seconds

func _on_message_timer_timeout():
	$Message.hide()

# Code for starting game
func new_game():
	$Replay.hide()
	$Main_Menu.hide()
	start_game.emit()

# Play again and menu options - equivalent of "Game Over" screen
func play_again():
	$Replay.show()
	$Main_Menu.show()
	
func _on_Replay_pressed():
	$Replay.hide()
	$Main_Menu.hide()
	new_game()

func _on_Main_Menu_pressed():
	get_tree().change_scene_to_file("res://minigames_scene.tscn")

func update_score(score):
	$Score.text = "Score: " + str(score)

# boilerplate i'm scared to delete
func _ready():
	new_game()
	pass # Replace with function body.

func _process(delta):
	pass
#	update_score($"../Score_Timer")



