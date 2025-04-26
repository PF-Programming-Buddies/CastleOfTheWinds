extends DraggableDestination
class_name FloorContainer

@export var accepted_equipment: String

func _ready():
	connect("on_item_release", on_item_released)
	
func on_item_released(itemResult: ItemEquipResult):
	# this is an inventory slot, and doesnt need to check the item type
	itemResult.isSuccess = true
