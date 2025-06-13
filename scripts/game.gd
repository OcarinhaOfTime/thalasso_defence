extends Node
@onready var score_label = $ui/score_label
@onready var passed_label = $ui/passed_label
@onready var go_control = $game_over_ui/game_over_control

@onready var enemy_spawner = $enemy_spawner
@onready var defence_area = $defence_area

var score: int = 0
var passed: int = 0

var restarting: bool = false
var game_ended: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_spawner.enemy_died.connect(on_enemy_died)
	defence_area.body_entered.connect(on_enemy_passed)

func on_enemy_died():
	score += 1
	score_label.text = 'Score ' + str(score)

func on_enemy_passed(enemy):
	print('enemy passed', enemy.name)
	passed += 1
	passed_label.text = 'Passed: ' + str(passed)

	if passed >= 3 and not game_ended:
		print('the game is over!!!')
		game_over()

func _process(delta:float):
	if Input.is_key_pressed(KEY_R) and not restarting:
		restarting = true
		print('restarting')
		get_tree().change_scene_to_file("res://scenes/main.tscn")

func game_over():
	game_ended = true
	
	propagate_call('_on_game_over')
	var tween = create_tween()
	tween.tween_property(go_control, 'modulate:a', 1, 3).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	print('it is done bozo')


