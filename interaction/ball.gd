extends CharacterBody2D

var vel = Vector2(0, 0)
var speed = 600

func _physics_process(delta):
	if vel == Vector2(0, 0):
		vel = get_global_mouse_position() - global_position
		# Obtenir la position de la souris dans l'espace de la scène
		var mouse_position = get_local_mouse_position()
	
		# Calculer la direction de tir par rapport à la position du sprite (ou du canon)
		var direction = (mouse_position - global_position).normalized()
	
		# Calculer l'angle de rotation en radians
		var angle_radians = atan2(mouse_position.y, mouse_position.x)
	
		# Convertir l'angle en degrés pour la rotation du sprite
		var angle_degrees = rad_to_deg(angle_radians)
	
		# Appliquer la rotation au sprite
		rotation_degrees = angle_degrees
	var colide_info = move_and_collide(vel.normalized() * delta * speed)
	
	if move_and_collide(vel.normalized() * delta * speed):
		queue_free()
	

func _on_area_2d_area_entered(area):
	print("ls")
	#pass # Replace with function body.
