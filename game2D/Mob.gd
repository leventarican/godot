extends RigidBody2D

export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.
var mob_types = ["walk", "swim", "fly"]

func _ready():
	# randomly choose one of the mob type
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	# delete mob's
	queue_free()
