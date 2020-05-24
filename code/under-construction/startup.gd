extends Node

# autoload this script: project settings > autoload

func _ready():
	var root = get_tree().root as Viewport
	# Viewport has the signal size_changed()
	root.connect("size_changed", self, "resize")
	OS.set_window_title("changed by startup script.")
	#OS.window_fullscreen = true
	set_process_input(true)
	print("ready")

# called when window is resized
func resize():
	var root : Viewport = get_tree().root
	var resolution = root.get_visible_rect()
	print(resolution)
	# (0, 0, 1920, 1080)

func _input(event):
	if (event.is_class('InputEventKey')):
		if (event.is_pressed()):
				if (event.scancode == KEY_ESCAPE):
					get_tree().quit()
