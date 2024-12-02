extends Control

func _process(delta: float) -> void:
	if Globals.paused == false:
		$".".visible = false
	else:
		$".".global_position = global_position
		$".".visible = true



func _on_button_pressed() -> void:
	if Globals.paused == true:
		Globals.paused = false
		$".".visible = false
		Engine.time_scale = 1
