extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	var button = get_node("Button")
	button.connect("pressed", self, "_on_nodeButton_signalPressed")

# _on_[EmitterNode]_[signal_name]
func _on_nodeButton_signalPressed():
	print_debug('button pressed.')
	
	var label = get_node("Label")
	label.text = 'hello Godot'