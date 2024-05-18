extends Node3D

func _physics_process(delta):
	if $Area3D.overlaps_body($"../Goku") == true:
		$Label3D.show()
		if Input.is_action_pressed("Menu_si"):
			$ColorRect.show()
			
	if $ColorRect.visible == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		

func _on_button_2_pressed():
	$ColorRect.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_button_pressed():
	if GlobalVar.chatarra_count >= 10:
		print("compraste arma xdddd")
		$ColorRect.hide()
		GlobalVar.chatarra_count -= 10
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		print("no tienes chatarra pobreton")
		$ColorRect.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_area_3d_body_exited(body):
	$Label3D.hide()
