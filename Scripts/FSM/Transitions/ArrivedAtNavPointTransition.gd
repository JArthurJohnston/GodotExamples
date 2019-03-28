extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const PatrollingState = preload("../States/PatrolingState.gd")

const ARRIVAL_KEY = 'ARRIVED_AT_TARGET'
const PATROLLING_STATE_ID = 'PATROLING'
const LOOKING_STATE_ID = 'LOOK_AROUND'

func will_change(values_dict: Dictionary):
	if(values_dict[ARRIVAL_KEY]):
		state_id = LOOKING_STATE_ID
	return values_dict[ARRIVAL_KEY]
