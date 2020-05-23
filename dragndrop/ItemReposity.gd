extends Node

const IMAGE_PATH = "res://assets/kenney/"
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
	}
}

func get_item(item_id):
	if item_id in ITEMS:
		return ITEMS[item_id]
	else:
		return ITEMS["error"]
