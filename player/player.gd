extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const run = 610

@onready var animation = get_node("AnimatedSprite2D")


func _physics_process(delta):
	var direction_right_left = Input.get_axis("ui_left", "ui_right")
	var direction_down_up = Input.get_axis("ui_up", "ui_down")	

	if Input.get_axis("ui_right", "ui_left"):
		velocity.x = direction_right_left * SPEED
		animation.scale.x = 7.516
		if Input.is_action_pressed("ui_left"):
			animation.scale.x = -7.516
		#animation.play("run")
	else:
		animation.scale.x *= 1
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#animation.play("idle")
		
	if Input.get_axis("ui_up", "ui_down"):
		velocity.y = direction_down_up * SPEED
		#animation.play("run")
	else:
		animation.scale.y *= 1
		velocity.y = move_toward(velocity.y, 0, SPEED)
		#animation.play("idle")
		
	if Input.is_action_pressed("ui_left"):
		animation.play("run")
	elif Input.is_action_pressed("ui_right"):
		animation.play("run")
	elif Input.is_action_pressed("ui_up"):
		animation.play("run")
	elif Input.is_action_pressed("ui_down"):
		animation.play("run")
	else:
		animation.play("idle")
	
	move_and_slide()
