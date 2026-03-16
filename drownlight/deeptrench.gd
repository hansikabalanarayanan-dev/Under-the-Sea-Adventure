extends Node2D

func _ready():
	$SurvivalTimer.start()

func _on_survival_timer_timeout():
	var player = get_tree().get_first_node_in_group("player")
	if player and not player.dead:
		get_tree().change_scene_to_file("res://victory_scene.tscn")
