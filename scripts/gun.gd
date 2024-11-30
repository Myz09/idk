class_name Gun extends Marker2D

const bullet_velocity = -450
const Bullet = preload("res://scenes/bullet.tscn")

func shoot(direction :float = 1.0) -> bool:
	var bullet := Bullet.instantiate()
	bullet.global_position = global_position
	bullet.apply_impulse( Vector2(bullet_velocity,0).rotated(rotation), Vector2())
	bullet.rotation_degrees = rotation_degrees
	
	bullet.set_as_top_level(true)
	add_child(bullet)
	$shoot.play()
	
	return true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
