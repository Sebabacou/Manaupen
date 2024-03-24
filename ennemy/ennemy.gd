extends CharacterBody2D


const speed = 90

var min = 0
var max = 50
var life = randi() % (max - min + 1) + min

@export var player: Node2D

@onready var nav : NavigationAgent2D
@onready var anim = get_node("AnimatedSprite2D")

const Bullet = preload("res://interaction/ball.tscn")

func _physics_process(_delta : float) -> void:
	var velo = player.global_position - global_position
	velo = velo.normalized()
	velocity = velo * speed
	move_and_slide()

func makepath() -> void:
	nav.target_position = player.global_position

func _on_timer_timeout():
	makepath()

func _on_ready():
	nav = $NavigationAgent2D
	nav.path_desired_distance = 30.0
	nav.target_desired_distance = 20.0
	call_deferred("actor_setup")
	anim.play("default")
	
func actor_setup():
	await get_tree().physics_frame
	set_movement_target(player.global_position)
	

func set_movement_target(player : Vector2):
	nav.target_position = player

func _on_area_2d_body_entered(body):
	if body.get_name() == "ball":
		body.queue_free()
		life = life - 10
		print(life)
		if life <= 0:
			queue_free()
