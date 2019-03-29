extends "res://Scripts/FSM/States/AbstractState.gd"

const LOOK_ROTATION = 180
	
func entered():
	subject.rotate_over_time(LOOK_ROTATION)
