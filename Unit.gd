extends KinematicBody

onready var navigator :Navigation = get_parent()

var path = []
const move_speed = 400
const UP = Vector3(0,1,0)

onready var nav = get_parent()
func _ready():
	add_to_group("units")
	move_to_nav_point()

func _physics_process(delta):
	if path.size() > 0:
		var target = path[0]
		var current_position = global_transform.origin
		var direction = (target - current_position)
		if current_position.distance_to(target) < 0.2:
			path.remove(0)
		else:
			look_at(target, UP);
			move_and_slide(direction.normalized() * move_speed * delta, UP)

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)

func move_to_nav_point():
	var navPoints = get_tree().get_nodes_in_group("NavPoints")
	var target: Spatial = navPoints[3]
	path = navigator.get_simple_path(global_transform.origin, target.global_transform.origin)
