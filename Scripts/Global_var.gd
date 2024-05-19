extends Node

var chatarra_count
var pausa : bool = false
var char_state : String

#Salud
var vida_jugador = 10
var vida_enemigo = 5



func _ready():
	chatarra_count = 10
	
func _physics_process(delta):
	pass
	#print(chatarra_count)
