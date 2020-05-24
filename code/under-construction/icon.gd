extends Sprite

# center the sprite
func _ready():
	center_relativ_camera()
	
func center_relativ_camera():
	var camera = get_node("/root/RootNode/CurrentCamera") as Camera2D
	self.position = camera.get_camera_screen_center()

func center_relativ_viewport():
	var rect = get_viewport_rect() as Rect2
	var size = rect.size as Vector2
	self.position = Vector2(size.x / 2, size.y / 2)

# move the sprite. 
# NOTE: its better to do this with KinemticBody2D.
func _physics_process(delta):
	var direction = Vector2()
	
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	if (RIGHT):
		self.position.x = self.position.x + int(RIGHT) + int(delta)
	elif (LEFT):
		self.position.x = self.position.x - int(LEFT) + int(delta)
	elif (UP):
		self.position.y = self.position.y - int(UP) - int(delta)
	elif (DOWN):
		self.position.y = self.position.y + int(DOWN) + int(delta)
