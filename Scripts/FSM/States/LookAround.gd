extends "res://Scripts/FSM/States/AbstractState.gd"

const LOOK_ROTATION = 180
const LOOKING_KEY = 'IS_LOOKKING'

func identifier():
	return "LOOK_AROUND"
	
func entered():
	subject.rotate_over_time(LOOK_ROTATION)
	machine.set_value(LOOKING_KEY, true)

func handle_process(delta):
	if(!subject.is_rotating()):
		machine.set_value(LOOKING_KEY, false)
