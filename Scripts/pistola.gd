extends Sprite3D

func get_3d_mouse_position() -> Vector3:
	
	var mouse_position = get_viewport().get_mouse_position()
	var camera = $"../Camera3D".get_viewport().get_camera_node()
	var ray_origin = camera.project_ray_origin(mouse_position)
	var ray_direction = camera.project_ray_direction(mouse_position)
	return ray_origin.direction_to(ray_origin + ray_direction * camera.far_clip_plane)
	print(mouse_position)
