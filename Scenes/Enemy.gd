extends KinematicBody
const Player = preload("Player.gd") # Relative path
const Raycast = preload("res://Scripts/Raycast.gd")

const FIELD_OF_VIEW = 50
const move_speed = 600
const UP = Vector3(0,1,0)
const gravity = -9.8
const rotation_speed = 300

var playerManager
var navigator :Navigation
var path = []
var velocity: Vector3
var rotation_angle = 0
var starting_rotation: Vector3

func _ready():
	playerManager = get_node("/root/PlayerManager")
	starting_rotation = rotation
	
func _process(delta):
	handle_rotation(delta)

func _physics_process(delta):
	handle_movement(delta)
	can_see_player()

func can_see_player():
	if(player_is_in_field_of_view()):
		var player = playerManager.get_player()
		var hit = Raycast.between(self, player)
		if hit:
			if hit.collider == player:
				return true
	return false

func handle_movement(delta):
	if path.size() > 0:
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
		set_rotation(Vector3(starting_rotation.x, rotation.y, starting_rotation.z)) # locks rotation
	
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

func is_rotating():
	return rotation_angle > 0

func player_is_in_field_of_view():
	if(playerManager):
		var player = playerManager.get_player()
		var angle = angle_from_target(player.get_global_transform().origin)
		return abs(angle) < FIELD_OF_VIEW

func angle_from_target(target: Vector3):
	var my_forward_direction = get_global_transform().basis.z
	var my_position = get_global_transform().origin
	var my_2d_direction = Vector2(my_forward_direction.x, my_forward_direction.x)
	var direction_to_target = Vector2(target.x - my_position.x, target.z - my_position.z)
	return rad2deg(my_2d_direction.angle_to(direction_to_target))
