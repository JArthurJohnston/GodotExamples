extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const PatrollingState = preload("../States/PatrolingState.gd")
const LookAround = preload("../States/LookAround.gd")

func changing_state():
	if state.arrived_at_target():
		return LookAround
