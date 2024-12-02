extends Control



func _on_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_intro_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/intro.tscn")
