extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const PatrollingState = preload("../States/PatrolingState.gd")
const LookAround = preload("../States/LookAround.gd")

const ARRIVAL_KEY = 'ARRIVED_AT_TARGET'
const ARRIVAL_THRESHOLD = 2

func will_change(values_dict: Dictionary):
	if(values_dict[ARRIVAL_KEY]):
		state_id = LookAround
	return values_dict[ARRIVAL_KEY]

func changing_state():
	if state.arrived_at_target():
		return LookAround
