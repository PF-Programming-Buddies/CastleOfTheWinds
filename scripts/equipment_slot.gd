extends DraggableDestination
class_name EquipmentSlot

@export var accepted_equipment: String

func _ready():
	connect("on_item_release", on_item_released)
	
func on_item_released(itemResult: ItemEquipResult):
	itemResult.isSuccess = equip(itemResult.item)

func equip(item: Item):
	if item.slot_type == accepted_equipment:
		# can equiped
		#if item:
			# return to inventory
			# then equip
		return true
	return false
