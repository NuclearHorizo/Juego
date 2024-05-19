extends CharacterBody2D

const Speed = 60
var direction = 1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animation_enemigo = $AnimatedSprite2D
var atacar = false

func _process(delta):
	if not atacar:
		animation_enemigo.play("Run")
		
	if ray_cast_right.is_colliding():
		direction = -1 
		animation_enemigo.flip_h = true
	if ray_cast_left.is_colliding():
		direction = +1
		animation_enemigo.flip_h = false
	position.x += direction * Speed * delta 

func _on_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		atacar = true
		if atacar == true:
			animation_enemigo.play("Ataque")
			direction = 0
			GlobalVar.vida_jugador -= 1
			print(GlobalVar.vida_jugador)
			$Timer.start(1.0)
	pass
func _on_timer_timeout():
	atacar = false
	direction = 1 if not animation_enemigo.flip_h else -1
	pass # Replace with function body.
