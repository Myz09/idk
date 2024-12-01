extends Node2D

const SPEED = 60
var direction = 1

var health : int = 3

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


func _on_hurtbox_area_entered(area: Area2D) -> void:
	print("hurtbox area entered")
	if area.get_parent().has_method("getdamage"):
		var nod = area.get_parent() as Node
		health -= nod.damageamount
		print("health: ", health)
		
		if health <= 0:
			queue_free()
	
