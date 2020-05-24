extends Node

# https://www.youtube.com/watch?v=fl0HFWAwqm0

func _ready():
	print(get_node("."))
	print(get_node("/root"))
	#[Node:1174]
	#[Viewport:1154]
	
	$WindowDialog.popup()
