extends Area2D

@export var speed:float = 400
@export var damage:int = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(on_body_entered)


func on_body_entered(body):
	if body.name == 'tower':
		#print('We hit the tower')
		return


	print('hit', body.name)
	if body.has_method('take_damage'):
		body.take_damage(damage)

	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position += Vector2(speed * delta, 0)

	if position.x > 3000:
		print('proj deleting myself', self)
		queue_free()
