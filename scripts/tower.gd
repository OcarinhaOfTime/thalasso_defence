extends Node

#get
@onready var spawn_point = $spawn_point
@onready var timer = $timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawn)
	timer.start()

func  spawn():
	var proj_scene = preload('res://scenes/proj_bomb.tscn')
	var inst = proj_scene.instantiate()
	get_parent().add_child(inst)
	inst.global_position = spawn_point.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_game_over():
	print('tower dead')
	queue_free()
