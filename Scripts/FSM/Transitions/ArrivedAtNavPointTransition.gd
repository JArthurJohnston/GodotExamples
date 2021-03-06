extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const PatrollingState = preload("../States/PatrolingState.gd")
const LookAround = preload("../States/LookAround.gd")

func changing_state():
	if state.arrived_at_target():
		return LookAround
		
func will_change():
	return state.arrived_at_target()
	
func target_state():
	return LookAround
