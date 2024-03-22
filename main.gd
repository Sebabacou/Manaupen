extends Node2D

func _ready():
	pass

func _process(delta):
	pass

func _on_button_quit_pressed():
	get_tree().quit()

func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn") # Replace with function body.
