extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const PatrollingState = preload("../States/PatrolingState.gd")

func changing_state():
	if !get_subject().is_rotating():
		return PatrollingState
	# if subject can see player
		# return catch player
