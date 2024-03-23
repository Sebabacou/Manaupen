extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const BulletPath = preload("res://Bullet.tscn")

var shoot_timer = 0.0
var shoot_delay = 0.1  # Limite de tir toutes les 0.5 secondes


func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	var direction_up_down = Input.get_axis("ui_up", "ui_down")
	shoot_timer += delta
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and shoot_timer > shoot_delay:
		shoot()
		shoot_timer = 0.0
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction_up_down:
		velocity.y = direction_up_down * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	$Node2D.look_at(get_global_mouse_position())
	move_and_slide()

func shoot():
	var Bullet = BulletPath.instantiate()
	get_parent().add_child(Bullet)
	#print(get_global_mouse_position())
	Bullet.position = $Node2D/Marker2D.global_position

