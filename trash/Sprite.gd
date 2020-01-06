extends Sprite

# movement in pixels/frame
var movement = Vector2(2, 0)
var parent_sprite

func _ready() -> void:
	parent_sprite = $Sprite.get_parent()
	
	# Returns a Rect2 representing the Sprite's boundary in local coordinates.
	var parent_sprite_rect = parent_sprite.get_rect()
	print(parent_sprite_rect)
	print(parent_sprite_rect.size)

func _process(delta):
	#print(delta)
	#print(Performance.get_monitor(Performance.TIME_FPS))
	
	parent_sprite.position += movement
	$Sprite.position += movement