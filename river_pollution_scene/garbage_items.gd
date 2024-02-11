extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 300

var poison_dmg = 20#:int

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	position = Vector2(563+10,144+10)

func _physics_process(delta):
	print(position)
	velocity.y =0#= GRAVITY
	# Add the gravity.
	velocity.x =0#-= delta * SPEED

	move_and_slide()
	#print(position)
	

func _on_area_2d_area_entered(area):
	print("HIT")
	poison_dmg -= 1
	#poison -= 1
	 # Replace with function body.
func get_data():
	return poison_dmg
