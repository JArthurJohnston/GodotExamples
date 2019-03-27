extends Node

onready var subject = get_parent()
onready var states = get_children()

var current_state 
var values = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = states[0]
	current_state.on_enter(subject)
	# For now the FSM will assume the first state node is the default state

func _process(delta):
	current_state.handle_process(subject, delta)
	check_for_state_change(delta)

func _physics_process(delta):
	current_state.handle_physics_process(subject, delta)
	check_for_state_change(delta)

# This assumes the first state it finds that will change is the correct one
# meaning the order that state & transition nodes are added is important
# this may change in the future if this becomes a headache
func check_for_state_change(delta):
	for each_transition in current_state.transitions:
		if each_transition.will_change(values):
			transition_to(each_transition.new_state_id())
			return
	
func transition_to(state_id):
	current_state.on_exit(subject)
	current_state = find_state(state_id)
	current_state.on_enter(subject)

func get_value(key):
	return values[key]
	
func set_value(key, value):
	values[key] = value
	
func find_state(identifier):
	for each_state in states:
		if each_state.identifier() == identifier:
			return each_state
