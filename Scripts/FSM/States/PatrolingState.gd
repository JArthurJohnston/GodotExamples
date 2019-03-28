extends "res://Scripts/FSM/States/AbstractState.gd"
const NavPoint = preload("../../../Scenes/NavPoint.gd") # Relative path

var target
const ARRIVAL_KEY = 'ARRIVED_AT_TARGET'
const ARRIVAL_THRESHOLD = 2

func identifier():
	return "PATROLING"

func entered():
	target = NavPoint.get_random(self).global_transform.origin
	subject.move_to(target)
	machine.set_value(ARRIVAL_KEY, false)

func exited():
	target = null

func handle_process(delta):
	if(is_current_state):
		if subject.global_transform.origin.distance_to(target) <= ARRIVAL_THRESHOLD:
			machine.set_value(ARRIVAL_KEY, true)
