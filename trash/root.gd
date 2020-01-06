extends Node

onready var fps_label = get_node('Label')

var title = "Basics"

func _ready() -> void:
	pass

# Called during the processing step of the main loop.
func _process(delta: float) -> void:
	Performance.get_monitor(Performance.TIME_FPS)
	OS.set_window_title(title + " | fps: " + str(Engine.get_frames_per_second()))
	fps_label.set_text(str(Engine.get_frames_per_second()))
