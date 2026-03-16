extends Area2D

var collected = false

func _ready():
	add_to_group("gold")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if collected:
		return
	if body.name == "player":
		collected = true
		get_parent().gold_collected()
		queue_free()
