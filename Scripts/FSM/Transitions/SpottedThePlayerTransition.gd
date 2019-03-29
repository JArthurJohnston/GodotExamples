extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const ChasePlayer = preload("res://Scripts/FSM/States/ChasePlayerState.gd")

func will_change():
	return get_subject().can_see_player()
	
func target_state():
	return ChasePlayer
