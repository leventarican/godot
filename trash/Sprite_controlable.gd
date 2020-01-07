extends Sprite

const SPEED = 400.0

var character
var boundary_max = 600
var boundary_min = 0

func _ready() -> void:
	character = get_node(".")

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_RIGHT):
		move(1, delta)
	if Input.is_key_pressed(KEY_LEFT):
		move(-1, delta)
		
func move(direction, delta):
	if direction == 0:
		return
	print(direction)
	character.position += Vector2(SPEED, 0) * delta * direction
	
	if character.position.x > boundary_max:
		character.position = Vector2(boundary_max, 0)
	if character.position.x < boundary_min:
		character.position = Vector2(boundary_min, 0)
		
	character.scale = Vector2(direction, 1)
