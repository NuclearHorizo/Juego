extends Control

func _ready():
	$".".hide()

func _physics_process(delta):
	_pausa()

func _pausa():
	
	if GlobalVar.pausa == true:
		$".".show()
	else:
		$".".hide()
			
	if Input.is_action_just_pressed("opciones") && $".".visible == false:
		GlobalVar.pausa = true
		get_tree().paused = true
		
	elif Input.is_action_just_pressed("opciones") && $".".visible == true:
		GlobalVar.pausa = false
		get_tree().paused = false
		

func _on_fullscreen_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif toggled_on == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
