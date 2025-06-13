extends CharacterBody2D

@export var speed:float = -100
@export var max_hp:int = 5
@export var hp:int = 5

@onready var hp_bar = $hp_bar

signal death()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp_bar.max_value = max_hp
	hp_bar.value = hp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = Vector2(speed, 0)
	move_and_slide()

func take_damage(damage:int):
	hp-=damage
	print('we took damage', hp, '/', max_hp)
	hp_bar.value = hp
	if hp <= 0:
		death.emit()
		queue_free()

func _on_game_over():
	print(name, ' enemy dead')
	queue_free()
