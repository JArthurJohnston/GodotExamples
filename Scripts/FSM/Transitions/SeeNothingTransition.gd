extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const PatrollingState = preload("../States/PatrolingState.gd")

const LOOKING_KEY = 'IS_LOOKKING'

func will_change(values_dict: Dictionary):
	if(!values_dict[LOOKING_KEY]):
		state_id = PatrollingState
	return !values_dict[LOOKING_KEY]

func changing_state():
	if !get_subject().is_rotating():
		return PatrollingState
	# if subject can see player
		# return catch player
