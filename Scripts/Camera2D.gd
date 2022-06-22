extends Camera2D

export (int) var velocidad = 400

func _physics_process(delta):
	position.x += velocidad*delta
