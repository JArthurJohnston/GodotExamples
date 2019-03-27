extends KinematicBody
onready var inputManager = get_node("/root/InputManager")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const speed = 600
const UP = Vector3(0,1,0)
const ZERO = Vector3(0,0,0)
const gravity = -9.8
var velocity = Vector3()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = getInputDirection(delta)
	
	if(direction != ZERO):
		velocity.y += gravity * delta
		velocity.x = direction.x
		velocity.z = direction.z
		
		#look_at(Vector3(direction.x, 0, direction.z), UP);
		velocity = move_and_slide(velocity, UP)

func getInputDirection(delta):
	return inputManager.get_input_direction() * speed * delta
