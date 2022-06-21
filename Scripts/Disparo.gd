extends RigidBody2D




func _on_Area2D_area_entered(area):
	if area.is_in_group("enemigo"):
		area.set_explosion()
	pass # Replace with function body.
