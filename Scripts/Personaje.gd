extends KinematicBody2D

export (int) var velocidad = 600

var movimiento = Vector2(0,0)
	
func get_inputs():
	movimiento = Vector2()
	if Input.is_action_pressed("move_right"):
		movimiento.x += velocidad
	if Input.is_action_pressed("move_left"):
		movimiento.x -= velocidad
	if Input.is_action_pressed("move_up"):
		movimiento.y -= velocidad
	if Input.is_action_pressed("move_down"):
		movimiento.y += velocidad

func _physics_process(_delta):
	get_inputs()
	movimiento = move_and_slide(movimiento)
