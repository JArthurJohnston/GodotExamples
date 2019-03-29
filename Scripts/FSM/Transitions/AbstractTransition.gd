extends Node
#const PatrollingState = preload("../States/PatrolingState.gd")
#const LookAround = preload("../States/LookAround.gd")

var state
var state_id

func get_subject():
	return state.get_subject()

func _ready():
	#print(PatrollingState, LookAround, get_script())
	state = get_parent()

func will_change(values: Dictionary):
	pass
	
func changing_state():
	pass

func new_state_id():
	return state_id

