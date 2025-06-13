extends Node2D
@export var spawn_min:float=2
@export var spawn_max:float=3

signal enemy_died()

func _ready() -> void:
	spawn()


func spawn():
	var enemy_scene = preload('res://scenes/enemy.tscn')
	var inst = enemy_scene.instantiate()
	add_child(inst)
	inst.global_position = position
	inst.death.connect(enemy_died.emit)

	var t = randf_range(spawn_min, spawn_max)
	get_tree().create_timer(t).timeout.connect(spawn)

func _on_game_over():
	print(name, ' enemy spawner dead')
	queue_free()