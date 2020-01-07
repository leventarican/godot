extends Sprite

var gravity
var sprite
var button_position_y

func _ready() -> void:
	gravity = 9.81
	sprite = get_node(".")
	button_position_y = get_node("../Button").get_rect().position.y
	
	for t in get_tree():
		print(t.text)
	
func _process(delta: float) -> void:
	if sprite.position.y < button_position_y:
		sprite.position.y += gravity
	