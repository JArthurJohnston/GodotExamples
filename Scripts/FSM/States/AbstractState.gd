extends Node

# Abstract class for State nodes
var transitions = []
var machine
var is_current_state: bool = false
var subject

func get_subject():
	return machine.get_subject()

func _ready():
	transitions = get_children()
	machine = get_parent()
	
func _process(delta):
	if(is_current_state):
		handle_process(delta)

func _physics_process(delta):
	if(is_current_state):
		handle_physics_process(delta)

func on_enter(subject_from_machine):
	is_current_state = true
	subject = subject_from_machine
	entered()

func on_exit(subject):
	is_current_state = false
	subject = null
	exited()
	
# Concrete implementations should override some or all of the following methods
func entered():
	pass
	
func exited():
	pass

func handle_process(delta):
	pass

func handle_physics_process(delta):
	pass
	
func will_change(dictionary):
	pass
	
func identifier():
	pass
