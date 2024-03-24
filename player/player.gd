extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const run = 610

@onready var animation = get_node("AnimatedSprite2D")
const BulletPath = preload("res://interaction/ball.tscn")

var shoot_timer = 0.0
var shoot_delay = 0.1
var is_reloading : bool = false

var chargeur_max = 15
var chargeur = chargeur_max

var enemy_in_range = false
var enemy_attack_cd = true
var health = 100
var alive = true

func _physics_process(delta):
	var direction_right_left = Input.get_axis("move_left", "move_right")
	var direction_down_up = Input.get_axis("move_up", "move_down")
	shoot_timer += delta

	if Input.get_axis("move_right", "move_left"):
		velocity.x = direction_right_left * SPEED
		animation.scale.x = 2 
		if Input.is_action_pressed("move_left"):
			animation.scale.x = -2
	else:
		animation.scale.x *= 1
		velocity.x = move_toward(velocity.x, 0, 30)
		
	if Input.get_axis("move_up", "move_down"):
		velocity.y = direction_down_up * SPEED
	else:
		animation.scale.y *= 1
		velocity.y = move_toward(velocity.y, 0, 30)
		
	if Input.is_key_pressed(KEY_R):
		reload()
	if Input.is_action_pressed("move_left"):
		animation.play("run")
	elif Input.is_action_pressed("move_right"):
		animation.play("run")
	elif Input.is_action_pressed("move_up"):
		animation.play("run")
	elif Input.is_action_pressed("move_down"):
		animation.play("run")
	else:
		animation.play("idle")
	
	$Node2D.look_at(get_global_mouse_position())

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and shoot_timer > shoot_delay:
		shoot()
		shoot_timer = 0
	
	move_and_slide()

func shoot():
	if chargeur == 0:
		return
	chargeur -= 1
	var Bullet = BulletPath.instantiate()
	Bullet.position = get_global_position() + (Vector2.from_angle(rotation) * 15)
	if animation.scale.x == -2:
			Bullet.position = get_global_position() + (Vector2.from_angle(rotation) * -15)
	get_parent().add_child(Bullet)
	if (chargeur == 0):
		$Label.setVisibilityTrue()

@onready var timer : Timer =  $rechargement
func reload():
	if (is_reloading):
		return
	$Label.setVisibilityFalse()
	is_reloading = true
	$Label2.setVisibilityTrue()
	timer.start()
	print(timer.is_stopped())
	
const BALL_GROUP = "ball"



func _on_rechargement_timeout():
	chargeur = chargeur_max
	print("la")
	is_reloading = false
	$Label2.setVisibilityFalse()
