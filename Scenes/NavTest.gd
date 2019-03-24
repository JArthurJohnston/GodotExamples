extends KinematicBody

onready var navigator :Navigation = get_parent()

var path
const SPEED = 0.000000005
const UP = Vector3(0,1,0)
const distance_threshold = 0.9

func _ready():
	move_to_nav_point()

func move_to_nav_point():
	var navPoints = get_tree().get_nodes_in_group("NavPoints")
	var target: Spatial = navPoints[0]
	path = navigator.get_simple_path(global_transform.origin, target.global_transform.origin)

func _fixed_process(delta):
	if path.size() > 0:
		var target = path[0]
		var current_position = global_transform.origin
		var distance = current_position.distance_to(target)
		if distance < distance_threshold:
			path.remove(0)
		else:
			var direction = (target - current_position).normalized()
			move_and_slide(Vector3(direction.x, 0, direction.z) * SPEED * delta, UP)

