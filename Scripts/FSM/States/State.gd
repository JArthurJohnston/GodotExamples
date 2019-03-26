extends Node

# Abstract class for State nodes
onready var transitions = get_children()

# Concrete implementations should override the following methods
func handle_process(subject, delta):
	pass
	
func will_change(dictionary):
	pass
	
func identifier():
	pass

func enter(subject, delta):
	pass
	
func exit(subject, delta):
	pass