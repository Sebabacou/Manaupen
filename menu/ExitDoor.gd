extends Area2D

@export var is_in = false

func _on_body_entered(body):
	if body.name == "Character":
		get_tree().quit()

func _process(delta):
	if is_in == true:
		get_tree().quit()
