extends Node2D

const SPEED = 60
var direction = 1

@onready var raycastr: RayCast2D = $raycastr
@onready var raycastl: RayCast2D = $raycastl
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
func _ready() -> void:
	$AudioStreamPlayer2D.play()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raycastr.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if raycastl.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	
	position.x += direction * SPEED * delta
