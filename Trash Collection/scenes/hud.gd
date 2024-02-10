extends CanvasLayer
signal start_game

func show_message(text):
	$"Message".text = text
	$"Message".show()
	$"MessageTimer".start()

func show_time_up():
	show_message("Time's up! ")
	await $"MessageTimer".timeout
	
	$Message.text = "Here's your score. "
	$Message.show()
	# short timer before next action
	await get_tree().create_timer(1.0).timeout
	$Message.text = "temporary message"
	$Message.show()
	
func update_score(score):
	$Score.text = "Score: " + str(score)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
