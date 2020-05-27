extends KinematicBody2D

const move_speed = 40
const gravity = 20
const less_gravity = 10

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("shoot"):
		print("shoot")
		$AnimationPlayer.play("shoot")
