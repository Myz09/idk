extends CharacterBody2D


const SPEED = 70.0
const JUMP_VELOCITY = -250.0
var double = true
var direction = -1.0
var t = false
var offset_distance = 30
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var bullet_velocity = -450
const bullet = preload("res://scenes/bullet.tscn")

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var gun: Gun = $AnimatedSprite2D/gun

func _on_timer_timeout():
	t = false
func fire():
	var bullet_instance = bullet.instantiate()

	# this is so the bullet spawns bit in front of the person
	bullet_instance.position = get_global_position() + Vector2(offset_distance, 0).rotated(rotation)
	bullet_instance.rotation_degrees = rotation_degrees

	#This has been altered since Godot 3
	bullet_instance.apply_impulse( Vector2(-bullet_velocity,0).rotated(rotation), Vector2())
	get_tree().get_root().call_deferred("add_child",bullet_instance)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_just_pressed("shoot"):# and t == false:
		fire()
		t = true
		$AnimatedSprite2D/Timer.start()
		print("timer started")

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or double):
		if not is_on_floor():
			double = false
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer2D.play()
	if is_on_floor():
		double = true
	else:
		velocity.y +=gravity*delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	#flip sprite
	if direction > 0:
		animated_sprite.flip_h = true
		bullet_velocity = 450
		offset_distance = -30
	elif direction < 0:
		animated_sprite.flip_h = false
		bullet_velocity = -450
		offset_distance = 30
		
	#play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
