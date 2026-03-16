extends CharacterBody2D

@export var speed = 200
@export var max_health = 100.0
var health = 100.0
var dead = false

signal health_changed(new_health, max_health)

func _ready():
	add_to_group("player")

func _physics_process(_delta):
	if dead:
		return
	var dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	velocity = dir.normalized() * speed
	move_and_slide()

func take_damage(amount: float):
	if dead:
		return
	health -= amount
	health = max(health, 0.0)
	emit_signal("health_changed", health, max_health)
	if health <= 0:
		die()

func die():
	if dead:
		return
	dead = true
	get_tree().reload_current_scene()
