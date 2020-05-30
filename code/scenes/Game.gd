extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	zoom()

# check InputMap for the key setup: zoom_in, zoom_out
func zoom():
	if Input.is_action_just_released('zoom_in'):
		print('+')
		$Camera2D.zoom.x -= 0.25
		$Camera2D.zoom.y -= 0.25
	if Input.is_action_just_released('zoom_out'):
		print('-')
		$Camera2D.zoom.x += 0.25
		$Camera2D.zoom.y += 0.25

# inspired by: https://www.youtube.com/watch?v=CqU6w164AbU&index=6&list=PLhqJJNjsQ7KEr_YlibZ3SBuzfw9xwGduK
func offset():
	var v = get_tree().root as Viewport
	
	# the same
	var t = v.get_canvas_transform()
	t = get_canvas_transform()
	t = get_viewport().get_canvas_transform() as Transform2D
	
	print(t)
	
	# do some offset: The transform's translation offset.
	t[2] = Vector2(-300.0, 100.0)
	v.canvas_transform = t


func _on_Button2_pressed():
	var eq = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1).get_node("EquipmentSlot")
