extends Node

var player;

func get_player():
	if(player == null):
		player = get_tree().get_nodes_in_group("player")[0]
	return player
