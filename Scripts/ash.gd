extends Node3D

var pj 

func _ready():
	$AnimationPlayer.play("mixamo_com")
	$Label3D.hide()
	$Panel.hide()
	pj = $"../../Goku"
	
func _physics_process(delta):
	
	if $Area3D.overlaps_body(pj) == true:
		$Label3D.show()

		if Input.is_action_pressed("Menu_si"):
			$Label3D.hide()
			$Panel.show()
	if $Panel.visible == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_button_pressed():
	
	PantallaCarga.cambiar_escena("res://Escenas/Mundo inicial.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _on_button_2_pressed():
	$Panel.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _on_area_3d_body_exited(body):
	$Label3D.hide()
