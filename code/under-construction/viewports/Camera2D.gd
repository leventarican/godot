extends Camera2D

func _ready():
	print("camera ready.")

func _process(delta):
	var c = $Camera2D as Camera2D
	
