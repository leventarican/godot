extends Panel

onready var slots = get_children()
var items = {}

func _ready():
	for slot in slots:
		print( slot.name )
		items[slot.name] = null

func insert_item(item):
	var item_pos = item.rect_global_position + item.rect_size / 2
	var slot = get_slot_under_pos(item_pos)
	print("slot: ", slot)
	if slot == null:
		return false
	
	print(item.get_meta("id"))
	
	var item_slot = ItemRepository.get_item(item.get_meta("id"))["slot"]
	if item_slot != slot.name:
		return false
	if items[item_slot] != null:
		return false
	items[item_slot] = item
	item.rect_global_position = slot.rect_global_position + slot.rect_size / 2 - item.rect_size / 2
	return true

func grab_item(pos):
	var item = get_item_under_pos(pos)
	if item == null:
		return null
	
	var item_slot = ItemRepository.get_item(item.get_meta("id"))["slot"]
	items[item_slot] = null
	return item

func get_slot_under_pos(pos):
	return get_thing_under_pos(slots, pos)

func get_item_under_pos(pos):
	return get_thing_under_pos(items.values(), pos)

func get_thing_under_pos(arr, pos):
	for thing in arr:
		if thing != null and thing.get_global_rect().has_point(pos):
			return thing
	return null


func _on_Button_pressed():
#	for slot in slots:
#		print(slot.get_global_rect())
	
	var l = Label.new()
	l.text = "GODOT"
	l.set_position(Vector2(100.0, 330.0))
	add_child(l)
