extends Node

const IMAGE_PATH = "res://assets/"
const ITEMS = {
	"bear": {
		"icon": IMAGE_PATH + "bear.png",
		"slot": "ANIMAL0"
	},
	"chicken": {
		"icon": IMAGE_PATH + "chicken.png",
		"slot": "ANIMAL1"
	},
	"cow": {
		"icon": IMAGE_PATH + "cow.png",
		"slot": "ANIMAL2"
	},
	"rabbit": {
		"icon": IMAGE_PATH + "rabbit.png",
		"slot": "ANIMAL3"
	},
	"giraffe": {
		"icon": IMAGE_PATH + "giraffe.png",
		"slot": "ANIMAL4"
	}
}

func get_item(item_id):
	if item_id in ITEMS:
		return ITEMS[item_id]
	else:
		return ITEMS["error"]
