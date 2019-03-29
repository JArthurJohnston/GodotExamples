extends "res://Scripts/FSM/States/AbstractState.gd"
const NavPoint = preload("../../../Scenes/NavPoint.gd") # Relative path

var target
const ARRIVAL_THRESHOLD = 2

func entered():
	target = NavPoint.get_random(self).global_transform.origin
	subject.move_to(target)

func exited():
	target = null

func arrived_at_target():
	return get_subject().global_transform.origin.distance_to(target) <= ARRIVAL_THRESHOLD
