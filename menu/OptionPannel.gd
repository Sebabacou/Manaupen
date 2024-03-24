extends Area2D

var is_in = false
var f_key_pressed = false

@onready var pause_menu = $"../../Character/CharacterCamera/OptionsMenu"
var paused = false

func _on_body_entered(body):
	if body.name == "Character":
		is_in = true

func _process(delta):
	if is_in == true:
		if Input.is_action_pressed("options_key") and !f_key_pressed:
			f_key_pressed = true
			handle_optionsMenu()
	else:
		f_key_pressed = false

func handle_optionsMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

func _input(event):
	if event.is_action_released("options_key"):
		f_key_pressed = false

func _on_body_exited(body):
	is_in = false

func on_exit_button_pressed():
	if paused:
		f_key_pressed = false
		handle_optionsMenu()

func _on_options_menu_exit_options_menu():
	pause_menu.hide()
	Engine.time_scale = 1
	f_key_pressed = false
