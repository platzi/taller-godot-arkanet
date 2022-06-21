extends Path2D

export (float) var speed = 200

onready var recorridos = get_children()

	
func _physics_process(delta):
	for recorrido in recorridos:
		recorrido.offset += speed*delta
