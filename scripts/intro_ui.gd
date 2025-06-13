extends Node

@onready var play_button = %play_button
@onready var options_button = %options_button
@onready var quit_button = %quit_button

@onready var menu = $menu
@onready var options = $options

@onready var options_back_button = %options_back_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(on_play)
	options_button.pressed.connect(enable_options)
	quit_button.pressed.connect(on_quit)

	options_back_button.pressed.connect(enable_menu)
	print('ayo, back button???', options_back_button)


func on_play():
	print('play_baby!')
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func on_options():
	pass

func on_quit():
	print('we out!')
	get_tree().quit()

func enable_menu():
	menu.visible = true
	options.visible = false

func enable_options():
	menu.visible = false
	options.visible = true