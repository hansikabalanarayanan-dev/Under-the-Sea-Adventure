extends Node2D

@export var tentacle_scene: PackedScene

func _ready():
	$AttackTimer.start()

func _on_attack_timer_timeout():
	var player = get_tree().get_first_node_in_group("player")
	if not player or player.dead:
		return
	var t = tentacle_scene.instantiate()
	t.global_position = global_position
	t.direction = (player.global_position - global_position).normalized()
	get_parent().get_node("tentacles").add_child(t)
