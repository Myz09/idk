extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	Globals.alive = false
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	body.get_node(".").gravity = 0
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	Globals.current_goombas = 0
	get_tree().reload_current_scene()
	Globals.alive = true
