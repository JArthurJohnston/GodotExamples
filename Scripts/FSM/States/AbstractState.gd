extends Node

# Abstract class for State nodes
var transitions = []
var machine

func _ready():
	transitions = get_children()
	machine = get_parent()

# Concrete implementations should override some or all of the following methods
func handle_process(subject, delta):
	pass

func handle_physics_process(subject, delta):
	pass
	
func will_change(dictionary):
	pass
	
func identifier():
	pass

func on_enter(subject):
	pass
	
func on_exit(subject):
	pass