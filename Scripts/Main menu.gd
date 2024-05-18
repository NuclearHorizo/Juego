extends Node3D

func _ready():
	$Control/Label/AnimationPlayer.play("Titulo")
	$"Camera3D".current = true
	$"Bajarle el volumen".play()
	
func _on_jugar_pressed():
	$"Control".hide()
	$Camera3D.current = false
	$"Bajarle el volumen".stop()
	PantallaCarga.cambiar_escena("res://Escenas/2D/niveles/Lvl_1.tscn")

func _on_salir_pressed():
	get_tree().quit()

