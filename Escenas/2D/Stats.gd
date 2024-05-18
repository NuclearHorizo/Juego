extends Control
var fps

func _physics_process(delta):
	fps = Engine.get_frames_per_second()
	$CanvasLayer/Fps.text = "Fps: " + str(fps)
	$CanvasLayer/Estado.text = "Estado: " + str(GlobalVar.char_state)
