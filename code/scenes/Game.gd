extends Node2D

# ui_up:0 ui_down:1 ui_left:2 ui_right:3
const UP = 0
const DOWN = 1
const LEFT = 2
const RIGHT = 3
var actions : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	zoom()
	while (actions.size() > 0):
		var action = actions.pop_front();
		print("process: ", action)
		print(actions.size())
		if (action == RIGHT):
			Input.action_press("ui_right")
			
			print("timer start")
			var t = Timer.new()
			t.set_wait_time(0.2)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			print("done")
			
			Input.action_release("ui_right")

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
	# scenetree > viewport > ...
	var equipmentslots = get_tree().get_root().get_child(2).get_child(0).get_child(1)
	if equipmentslots.has_method("get_items"):
		var items = equipmentslots.get_items()
		for i in items.values():
			if i != null:
				var id = i.get_meta("id")
				if (id == "bear"):
					print(id)
					actions.push_back(RIGHT)
					print(actions)
