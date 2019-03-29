extends "res://Scripts/FSM/States/AbstractState.gd"
var player_manager = preload("res://Scripts/PlayerManager.gd")

var target

func entered():
	print('chasing')
	var subject = get_subject()
	target = subject.visible_player_position()
	subject.face_target(target)
	subject.move_to(target)

func handle_process(delta):
	# raycast to player
	# if raycast hit
		# move to raycast hit position
	# else 
		# continue moving to last hit position
	# if arrived at last hit position
		# raycast to player
		#if no hit
			# lost player
	pass