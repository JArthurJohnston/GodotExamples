extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"

const LOOKING_KEY = 'IS_LOOKKING'
const PATROLLING_STATE = 'PATROLING'

func will_change(values_dict: Dictionary):
	if(!values_dict[LOOKING_KEY]):
		state_id = PATROLLING_STATE
	return !values_dict[LOOKING_KEY]
