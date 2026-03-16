
extends Node2D

var total_gold = 3
var collected_gold = 0
var level_completing = false

func gold_collected():
	if level_completing:
		return
	collected_gold += 1
	if collected_gold >= total_gold:
		level_completing = true
		level_complete()

func level_complete():
	await rumble_screen()
	fade_out()

func rumble_screen():
	for i in range(20):
		position = Vector2(randf_range(-10, 10), randf_range(-10, 10))
		await get_tree().create_timer(0.03).timeout
	position = Vector2.ZERO

func fade_out():
	var fade = $Fade
	for i in range(20):
		fade.modulate.a += 0.05
		await get_tree().create_timer(0.05).timeout
	get_tree().change_scene_to_file("res://deeptrench.tscn")
