extends Node

const UP = Vector3(0,1,0)

func move_on_path(subject: KinematicBody, path, speed, delta):
	if path.size() > 0:
		var target = path[0]
		var current_position = subject.global_transform.origin
		var direction = (target - current_position).normalized() * speed * delta
		if current_position.distance_to(target) < 1.5:
			path.remove(0)
		else:
			subject.look_at(target, UP); # make a rotate towards method to replace this
			
			#velocity.x = direction.x
			#velocity.y += gravity * delta
			#velocity.z = direction.z
			#velocity = move_and_slide(velocity, UP)