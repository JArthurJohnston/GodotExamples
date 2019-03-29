extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const PatrollingState = preload("../States/PatrolingState.gd")

func changing_state():
	if !get_subject().is_rotating():
		return PatrollingState
		
func will_change():
	return !get_subject().is_rotating()
	
func target_state():
	return PatrollingState
