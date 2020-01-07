extends Button

# signal pressed -> _on_Button_pressed
func _on_Button_pressed() -> void:
	get_node("../Label_button").set_text("button pressed")
	get_node("../Sprite_gravity").position.y = 40
