extends Node3D


func _on_cameraman_body_entered(Goku):
	
	$Goku.SPEED = 2
	$Node3D/cameraman/Camera3D.current = true
	$Goku.JUMP_VELOCITY = 3
	
func _on_cameraman_body_exited(Goku):
	
	$Goku.SPEED = 5
	$Node3D/cameraman/Camera3D.current = false
	$Goku.JUMP_VELOCITY = 4.5


func _on_cambio_body_entered(body):
	PantallaCarga.cambiar_escena("res://Escenas/Nivel1.tscn")
	
