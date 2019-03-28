extends Spatial

static func get_random(caller: Node):
	var navPoints = caller.get_tree().get_nodes_in_group("NavPoints")
	randomize()
	return navPoints[rand_range(0, navPoints.size() - 1)]

func _ready():
	add_to_group("NavPoints")
