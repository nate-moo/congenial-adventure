extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 300

var poison_dmg
var node2

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	pass
	#position = Vector2(563+10,144+10)

func _physics_process(delta):

	velocity.y = GRAVITY
	# Add the gravity.
	velocity.x -= delta * SPEED

	move_and_slide()
	#print(position)
	

func _on_area_2d_area_entered(area):
	print("HIT")
	node2 = get_parent()
	poison_dmg = node2.get_poison() - 1
	print(poison_dmg)
	node2.set_poison(poison_dmg)
	#poison -= 1
	 # Replace with function body.
	

func _on_child_entered_tree(node):
	position = Vector2(300,0)
	pass # Replace with function body.
