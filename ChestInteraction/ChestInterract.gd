class_name chestInterract extends Area2D

@export var interract_type = "none"
@export var interract_value = "close"

func open():
	if interract_value != "open":
		var animation = $AnimationPlayer
		animation.play("open")
		interract_value = "open"
