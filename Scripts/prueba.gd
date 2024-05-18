extends Node3D


func _on_area_3d_body_entered(body):
	$Camera3D2.set_current(true)
	$Goku.SPEED = 2
	$Goku.JUMP_VELOCITY = 3

func _on_area_3d_body_exited(body):
	$Camera3D2.set_current(false)
	$Goku.SPEED = 5
	$Goku.JUMP_VELOCITY = 4.5
