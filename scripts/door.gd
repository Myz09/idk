extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("hello")
	if body is Player:
		print("play")
		get_tree().change_scene_to_file("res://scenes/menu.tscn")




func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
