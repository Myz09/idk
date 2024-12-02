extends Node

var current_goombas = 0
var current_level = 0
var unlocked=0
var alive = true
var paused = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		paused = true
		Engine.time_scale = 0
	
