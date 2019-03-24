extends KinematicBody

onready var navigator :Navigation = get_parent()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var path_ind = 0
var path
var move_speed = 5
const UP = Vector3(0,1,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	move_to_nav_point()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	handle_path_movement(delta)

func handle_path_movement(delta):
	if path_ind < path.size():
		var target = path[path_ind]
		var move_vec = (global_transform.origin - path[path_ind])
		print(str(move_vec.length()))
		if move_vec.length() < 0.1:
			path_ind += 1
		else:
			move_and_slide(move_vec.normalized() * move_speed, UP)

func move_to(target_pos):
	path = navigator.get_simple_path(global_transform.origin, target_pos)
	path_ind = 0

func move_to_nav_point():
	var navPoints = get_tree().get_nodes_in_group("NavPoints")
	var target: Spatial = navPoints[3]
	move_to(target.global_transform.origin)
