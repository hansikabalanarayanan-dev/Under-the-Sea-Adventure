extends Area2D

var direction = Vector2.ZERO
@export var speed := 300.0
var lifetime := 0.0

func _ready():
	add_to_group("tentacle")
	body_entered.connect(_on_body_entered)

func _process(delta):
	position += direction * speed * delta
	lifetime += delta
	if lifetime > 3.0:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(25.0)
		queue_free()
