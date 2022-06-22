extends Node


var puntos = 0
var vidas = 3

func remove_vida():
	if vidas > 1:
		vidas -= 1
	else: 
		print("Perdiste")
	print("Vidas: "+String(vidas))
	
func add_puntos(valor):
	puntos += valor
	print("Puntos: "+String(puntos))
