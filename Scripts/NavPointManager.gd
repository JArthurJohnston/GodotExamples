extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const navPoints = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

static func add_nav_point(navPoint):
	navPoints.append(navPoint)
	pass
	
static func remove_nav_point(navPoint):
	navPoints.erase(navPoint)
	pass
	
static func empty_nav_points():
	navPoints.clear()
	pass

static func get_random_nav_point():
	return navPoints[3]
	pass
