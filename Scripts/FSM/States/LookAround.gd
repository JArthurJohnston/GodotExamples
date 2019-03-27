extends "res://Scripts/FSM/States/AbstractState.gd"

const LOOK_ROTATION = 180
const LOOKING_KEY = 'IS_LOOKKING'

func identifier():
	return "LOOK_AROUND"
	
func on_enter(subject):
	subject.rotate_over_time(LOOK_ROTATION)
	machine.set_value(LOOKING_KEY, true)

func handle_process(subject, delta):
	if(!subject.is_rotating()):
		machine.set_value(LOOKING_KEY, false)
