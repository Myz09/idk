class_name Bullet extends RigidBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var damageamount : int = 1

func _ready() -> void:
	$Sprite2D.play("default")
	$AudioStreamPlayer2D.play()
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	$AnimationPlayer.play(&"destroy")


func _on_hitbox_area_entered(area: Area2D) -> void:
	print("bullet area entered")
	
	
func getdamage() -> int:
	return damageamount
	
func _on_hitbox_body_entered(body: Node2D) -> void:
	print("bullet body entered")
