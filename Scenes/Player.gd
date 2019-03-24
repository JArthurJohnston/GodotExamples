extends KinematicBody
onready var inputManager = get_node("/root/InputManager")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const speed = 600
const UP = Vector3(0,1,0)
const gravity = -9.8
var velocity = Vector3()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = getInputDirection(delta)
	
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = move_and_slide(velocity, UP)
	pass
	
func getInputDirection(delta):
	return inputManager.get_input_direction() * speed * delta
	pass

