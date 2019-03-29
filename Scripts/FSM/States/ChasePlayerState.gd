extends "res://Scripts/FSM/States/AbstractState.gd"

func entered():
	# look at the player
	# set player location as target
	# move towards target
	pass

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