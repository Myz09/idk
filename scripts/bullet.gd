class_name Bullet extends RigidBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	$Sprite2D.play("default")
	$AudioStreamPlayer2D.play()
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	$AnimationPlayer.play(&"destroy")
