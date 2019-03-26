extends Node

onready var subject = get_parent()
onready var states = get_children()

var current_state 
var values = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = states[0]

func _process(delta):
	print('State: ' + str(current_state.name()))
	current_state.handle_process(subject, delta)
	for each_transition in current_state.transitions:
		if each_transition.will_change(values):
			transition_to(each_transition.new_state_id(), delta)
			return

func transition_to(state_id, delta):
	current_state.exit(subject, delta)
	current_state = find_state(state_id)
	current_state.enter(subject, delta)

func get_value(key):
	return values[key]
	
func set_value(key, value):
	values[key] = value
	
func find_state(identifier):
	# return the state matching the identifier
	pass