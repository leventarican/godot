extends Area2D

# for collision
signal hit

# export: make it avaiable on Inspector View (Script Variables section)
export var speed = 400

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Class in PascalCase
# function, vars in snake_case
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	print_debug(screen_size.x)
	
	# hide player on game start
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    # Check for input.
    # Move in the given direction.
    # Play the appropriate animation.
	
	var velocity = Vector2()
	# velocity has value (0,0)
	
	# movement direction 
	if Input.is_action_pressed("ui_right"):
	    velocity.x += 1
	if Input.is_action_pressed("ui_left"):
	    velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
	    velocity.y += 1
	if Input.is_action_pressed("ui_up"):
	    velocity.y -= 1
	if velocity.length() > 0:
	    velocity = velocity.normalized() * speed
	    $AnimatedSprite.play()
	else:
	    $AnimatedSprite.stop()

	# movement position
	# Clamping a value means restricting it to a given range
	# clamp: prevent form leaving screen.
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	# which animation?
	if velocity.x != 0:
	    $AnimatedSprite.animation = "right"
	    $AnimatedSprite.flip_v = false
	    # See the note below about boolean assignment
	    $AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
	    $AnimatedSprite.animation = "up"
	    $AnimatedSprite.flip_v = velocity.y > 0
	

# on collision: signal hit
func _on_Player_body_entered(body):
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

# reset game
func start(pos):
	print_debug('START#')
	position = pos
	show()
	$CollisionShape2D.disabled = false
