extends Area2D

@export var is_in = false

func _on_body_entered(body):
	is_in = true

func _process(delta):
	if is_in == true:
		get_tree().change_scene_to_file("res://world.tscn")
