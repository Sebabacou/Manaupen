class_name OptionsMenu
extends Control

@onready var exitButton = $MarginContainer/VBoxContainer/ExitButton as Button

signal exit_options_menu

func _ready():
	exitButton.button_down.connect(on_exit_pressed)
	set_process(false)

func on_exit_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
