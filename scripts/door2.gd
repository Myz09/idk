extends Area2D


func _on_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://scenes/end.tscn")



func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/end.tscn")
	

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	get_tree().change_scene_to_file("res://scenes/end.tscn")
