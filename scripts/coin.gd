extends Area2D

@onready var gamemanag: Node = %gamemanag



func _on_body_entered(body: Node2D) -> void:
	gamemanag.add_point()
	queue_free()
