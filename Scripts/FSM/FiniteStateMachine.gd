extends Node

var subject
var states
var current_state

func get_subject():
	if(subject == null):
		subject = get_parent()
	return subject

# Called when the node enters the scene tree for the first time.
func _ready():
	subject = get_parent()
	states = get_children()
	current_state = states[0]
	current_state.on_enter(subject)
	# For now the FSM will assume the first state node is the default state

# only checks for state changes during the normal update step, NOT the physics update
func _process(delta):
	handle_any_state_change(delta)

# This assumes the first state it finds that will change is the correct one
# meaning the order that state & transition nodes are added is important
# this may change in the future if this becomes a headache
func handle_any_state_change(delta):
	for each_transition in current_state.transitions:
		var transition_state_id = each_transition.changing_state()
		if transition_state_id != null && transition_state_id != current_state.identifier():
			transition_to(transition_state_id)
			return

func transition_to(state_id):
	current_state.on_exit(subject)
	current_state = find_state(state_id)
	current_state.on_enter(subject)

func find_state(identifier):
	for each_state in states:
		if each_state.identifier() == identifier:
			return each_state
