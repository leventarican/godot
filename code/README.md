# Drag and Drop example
* based on: https://www.youtube.com/watch?v=usWuBrrh5lQ
* assets based on: https://www.kenney.nl/assets/animal-pack-redux

## About
* _ItemRepository_: this contains the available items (in my case the animals)
* _Inventory_: is the main scene. here the grapping is implemented
    * we want to drag the items from _GridPackPack_ to _EquipmentSlots_
* for each of these nodes a script implements the behaviour:
``` 
ItemRepository.gd
Inventory.gd
GridPackPack.gd
EquipmentSlots.gd
``` 
* aside this we have 3 scenes
* `ItemRepository.tscn` contains our items
* `ItemBase.tscn` base on `TextureRect`. This is a kind of placeholder for the images. On load the Images are loaded dynamically in `Inventury.gd`
``` 
func _ready():
	pickup_item("bear")
	pickup_item("chicken")
	pickup_item("cow")
``` 
* `Inventory.tscn` the main scene with Backpack and Slots (for equipments / items)
    * Project > Project Settings > Run > Main Scene ...

## Autoload / Singleton
* with Autoload we can define a scene as a Singleton and access it from script.
    * Project > Project Settings > Autload > Add the scene
    * example access: `ItemRepository.get_item (...`

![screenshot](screenshot.png)
