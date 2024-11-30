extends Node

var score = 0

@onready var scorel: Label = $scorel


func add_point():
	score += 1
	scorel.text = "you collected " + str(score) + " coins"
