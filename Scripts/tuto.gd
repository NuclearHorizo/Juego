extends Node3D

func _ready():
	$"vainas locas/flecha/AnimationPlayer".play("color")
	$"vainas locas/AudioStreamPlayer3D".play()
	$"vainas locas/movement".show()
