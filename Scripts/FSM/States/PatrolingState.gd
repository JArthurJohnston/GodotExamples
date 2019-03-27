extends "res://Scripts/FSM/States/AbstractState.gd"

var target
const ARRIVAL_KEY = 'ARRIVED_AT_TARGET'

func identifier():
	return "PATROLING"

func on_enter(subject):
	target = find_random_nav_point().global_transform.origin
	subject.move_to(target)
	machine.set_value(ARRIVAL_KEY, false)
	
func on_exit(subject):
	target = null
	
func handle_process(subject, delta):
	if subject.global_transform.origin.distance_to(target) <= 0.5:
		machine.set_value(ARRIVAL_KEY, true)
	
func find_random_nav_point():
	var navPoints = get_tree().get_nodes_in_group("NavPoints")
	randomize()
	return navPoints[rand_range(0, navPoints.size() - 1)]
