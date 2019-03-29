
static func between(origin: Spatial, target: Spatial):
	var space_state: PhysicsDirectSpaceState = origin.get_world().get_direct_space_state()
	return space_state.intersect_ray(origin.global_transform.origin, target.global_transform.origin)
