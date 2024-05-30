extends CharacterBody2D

@export var SPEED = 200  
@export var GRAVITY = 9.8 
@export var JUMP_FORCE = 450  
var dir = Vector2.ZERO
var state_machine
var fps


func _physics_process(delta):
	character_state()
	movimiento()
	anim()
	$items/Lamapra.look_at(get_global_mouse_position())
	if GlobalVar.char_state != "pared_desliz":
		GRAVITY = 9.8
	
func _ready():
	$AnimationTree.active = true
	GlobalVar.pausa = false
	state_machine = $AnimationTree.get("parameters/playback")
	
func character_state():
	if is_on_floor() && velocity == Vector2(0,0):
		GlobalVar.char_state = "parado"
		
	if not is_on_floor() && not is_on_wall():
		GlobalVar.char_state = "aire"
		
	elif Input.is_action_pressed("abajo") && velocity.x == 0 && velocity.y == 0:
		GlobalVar.char_state = "agachado"

	elif velocity.x != 0:
		GlobalVar.char_state = "moviendose"
			
	elif is_on_wall() && velocity.y > 0:
		GlobalVar.char_state = "pared_desliz"
		
func movimiento():
	dir.x = Input.get_action_strength("move_der") - Input.get_action_strength("move_izq")
	
	if Input.is_action_just_pressed("salto") and is_on_floor():
			velocity.y = JUMP_FORCE 
			
	velocity.x = dir.x * SPEED
	velocity.y += GRAVITY 
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity

func anim():
	
	#Correr
	
	if velocity.x < 0:
		state_machine.travel("Correr")
		$PJ.flip_h = true
		
	elif velocity.x > 0:
		state_machine.travel("Correr")
		$PJ.flip_h = false
		
	else:
		state_machine.travel("Idle")
		
	#Salto
		
	if not is_on_floor():
		if velocity.y > 0:
			state_machine.travel("salto_caer")
				
		else:
			state_machine.travel("Salto")
		
	#Pared
	if GlobalVar.char_state == "pared_desliz":
		if Input.is_action_pressed("move_der"):
			$PJ.flip_h = true
			$efectos.flip_v= true
			acciones()

		elif Input.is_action_pressed("move_izq"):
			$PJ.flip_h = false
			$efectos.flip_v= false
			acciones()
		else:
			GRAVITY = 9.8
			$efectos.hide()
		
			
	else:
		$efectos.hide()
		
	#Agachado
	
	if Input.is_action_pressed("abajo") && velocity.x == 0 && velocity.y == 0:
		state_machine.travel("Agacharse_inicio")

func pared():
	if is_on_wall() && velocity.y > 0:
		GRAVITY = 3
		state_machine.travel("pared_dezlis")
		$efectos/AnimationPlayer.play("tierrita")
		$efectos.show()
		if Input.is_action_just_pressed("salto"):
			velocity.y = JUMP_FORCE
			GlobalVar.char_state = "aire"
			
func acciones():
	#Estados del personaje:
	#	1."parado"			5."move_izq"
	#	2."aire"			6."move_der"
	#	3."agachado"		7.Nada
	#	4."pared_desliz"	8.Nada
	match GlobalVar.char_state:
		"pared_desliz":
			pared()
		#"move_der":
			#state_machine.travel("Correr")
			#$PJ.flip_h = false
			#
		#"move_izq":
			#state_machine.travel("Correr")
			#$PJ.flip_h = true
			#
		#"parado":
			#state_machine.travel("Idle")
			#
		#"aire":
			#if velocity.y > 0:
				#state_machine.travel("salto_caer")
				#
			#else:
				#state_machine.travel("Salto")
				#
		#"agachado":
			#state_machine.travel("Agacharse_inicio")

