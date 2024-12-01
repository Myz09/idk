extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body is Player:	
		var y_delta = position.y -body.position.y
		if y_delta > 9.5:
			print("destroy enemy")
			$"../AnimatedSprite2D".play("die")
			$"..".queue_free()
		else:
			print("you died")
			Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").queue_free()
			timer.start()
	elif body is Bullet:
			print("destroy enemy")
			$"..".queue_free()



func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
