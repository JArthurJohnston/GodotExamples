extends Node

static func get_horizontal_input():
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	pass

static func get_vertical_input():
	return Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	pass
	
static func get_input_direction():
	return Vector3(get_horizontal_input(), 0, get_vertical_input()).normalized()
	pass
