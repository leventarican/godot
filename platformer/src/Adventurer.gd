extends KinematicBody2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

export var speed: = Vector2(400.0, 500.0)
export var gravity: = 3500.0

var velocity: = Vector2.ZERO

onready var animated_player: = get_node("Sprite/AnimationPlayer")
# or access with $Sprite/AnimationPlayer
onready var text_mode: = get_node("RichTextLabel")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	text_mode.text = "idle"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("move_left"):
		print('move left')
		velocity.x -= 500.0
	if Input.is_action_just_pressed("move_right"):
		print('move right')
		velocity.x += 500.0
		
	if Input.is_action_just_pressed("attack"):
		animated_player.play("attack")
		text_mode.text = "attack"
	if Input.is_action_just_pressed("jump"):
		animated_player.play("jump")

	#velocity.x += gravity * delta
	move_and_slide(velocity)

