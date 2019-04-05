extends "res://Scripts/FSM/Transitions/AbstractTransition.gd"
const LookAround = preload("../States/LookAround.gd")

func will_change():
	return !get_subject().is_moving() && !get_subject().can_see_player()

func target_state():
	return LookAround
