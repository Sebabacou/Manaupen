extends CharacterBody2D


const speed = 90

@export var player: Node2D

@onready var nav : NavigationAgent2D

func _physics_process(_delta : float) -> void:
	var test = nav.get_current_navigation_path()
	print(test)
	var velo = nav.get_next_path_position() - global_position
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
	
func actor_setup():
	await get_tree().physics_frame
	set_movement_target(player.global_position)
	

func set_movement_target(player : Vector2):
	nav.target_position = player
