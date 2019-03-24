extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group("units", "move_to", global_transform.origin)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
