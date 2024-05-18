extends Camera2D

#func _rayo():
	#var mouse_position = get_viewport().get_mouse_position()
	#var largo_rayo = 1000
	#var from = project_ray_origin(mouse_position)
	#var to = project_ray_normal(mouse_position) * largo_rayo
	#var space = get_world_3d().direct_space_state
	#var ray_query = PhysicsRayQueryParameters3D.new()
	#ray_query.from = from
	#ray_query.to = to
	#var raycast_result = space.intersect_ray(ray_query)
	#if not raycast_result.is_empty():
		#var pos = raycast_result.position
		#$"../pistola".look_at(Vector3(pos.x, pos.y, pos.z), Vector3(0,1,0))
