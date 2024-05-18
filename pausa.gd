extends Control

func _ready():
	$ColorRect.hide()

func _physics_process(delta):
	_pausa()

func _pausa():
	
	if GlobalVar.pausa == true:
		$ColorRect.show()
	else:
		$ColorRect.hide()
			
	if Input.is_action_just_pressed("opciones") && GlobalVar.pausa == false:
		GlobalVar.pausa = true
		get_tree().paused = true
		
	elif Input.is_action_just_pressed("opciones") && GlobalVar.pausa == true:
		GlobalVar.pausa = false
		get_tree().paused = false
		

func _on_fullscreen_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif toggled_on == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
