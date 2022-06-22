extends KinematicBody2D

export (int) var velocidad = 600

onready var Disparo = preload("res://Scenes/Disparo.tscn")
onready var playback = $AnimationTree.get("parameters/playback")

var movimiento = Vector2(0,0)
var cooldown = true

func get_inputs():
	movimiento = Vector2()
	if Input.is_action_pressed("move_right"):
		movimiento.x += velocidad
		playback.travel("move_right")
	if Input.is_action_pressed("move_left"):
		movimiento.x -= velocidad
		playback.travel("move_left")
	if Input.is_action_pressed("move_up"):
		movimiento.y -= velocidad
	if Input.is_action_pressed("move_down"):
		movimiento.y += velocidad
	if Input.is_action_pressed("attack"):
		disparar()
	if movimiento == Vector2():
		playback.start("RESET")

func disparar():
	if cooldown:
		cooldown = false
		$Timer.start()
		var instancia_disparo = Disparo.instance()
		instancia_disparo.global_position = $DisparoPos.global_position
		add_child(instancia_disparo)
		instancia_disparo.set_as_toplevel(true)

func _physics_process(_delta):
	get_inputs()
	movimiento = move_and_slide(movimiento)

func take_damage():
	$AnimationPlayer.play("take_damage")

func _on_Timer_timeout():
	cooldown = true
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.is_in_group("enemigo"):
		take_damage()
		area.set_explosion()
	pass # Replace with function body.
