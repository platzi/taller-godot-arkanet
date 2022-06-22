extends Node


var puntos = 0
var vidas = 3
var LabelPuntos 

func remove_vida():
	if vidas > 1:
		vidas -= 1
	else: 
		get_tree().reload_current_scene()
	
func add_puntos(valor):
	puntos += valor
	LabelPuntos.text = String(puntos)
