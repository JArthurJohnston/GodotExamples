extends KinematicBody
onready var inputManager = get_node("/root/InputManager")

var navigator :Navigation

var path = []
const move_speed = 400
const UP = Vector3(0,1,0)
var velocity: Vector3
var rotation_speed = 100
var rotation_angle = 0
const gravity = -9.8
var starting_rotation: Vector3

func _ready():
	starting_rotation = rotation
	add_to_group("units")

func _physics_process(delta):
	handle_movement(delta)
	handle_rotation(delta)

func handle_movement(delta):
	if path.size() > 0:
		#var target = Vector3(path[0].x, 0, path[0].z)
		var target = path[0]
		var current_position = global_transform.origin
		var direction = (target - current_position).normalized() * move_speed * delta
		if current_position.distance_to(target) < 1.5:
			path.remove(0)
		else:
			look_at(target, UP); # make a rotate towards method to replace this
			
			velocity.x = direction.x
			velocity.y += gravity * delta
			velocity.z = direction.z
			velocity = move_and_slide(velocity, UP)
		set_rotation(Vector3(starting_rotation.x, rotation.y, starting_rotation.z))
	
func handle_rotation(delta):
	if(is_rotating()):
		var degrees = rotation_speed * delta
		rotate_y(deg2rad(degrees))
		rotation_angle -= degrees

func get_navigator():
	if(navigator == null):
		navigator = get_parent()
	return navigator

func move_to(target_pos: Vector3):
	path = get_navigator().get_simple_path(global_transform.origin, target_pos)

func rotate_over_time(angle):
	rotation_angle = angle
	pass
	
func is_rotating():
	return rotation_angle > 0
