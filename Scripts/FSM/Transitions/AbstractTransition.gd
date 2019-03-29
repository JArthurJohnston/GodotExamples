extends Node
#const PatrollingState = preload("../States/PatrolingState.gd")
#const LookAround = preload("../States/LookAround.gd")

var state

func get_subject():
	return state.get_subject()

func _ready():
	state = get_parent()

func changing_state():
	pass


