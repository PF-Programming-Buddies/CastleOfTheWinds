extends Control
class_name DraggableDestination

class ItemEquipResult:
	var isSuccess = false
	var item: Item = null
	func _init(m_item: Item):
		item = m_item
		isSuccess = false

signal on_item_release(item: ItemEquipResult)

var hovered = false

func _enter_tree():
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	
func on_mouse_entered():
	print("hovered on container")
	hovered = true
	
func on_mouse_exited():
	print("hovered off container")
	hovered = false

func _input(event):
	if event is InputEventMouseButton:
		#if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			#if Orphanage.empty() and hovered:
				#var child = get_child(0)
				#if child:
					#remove_child(child)
					#child.position = Vector2.ZERO
					#Orphanage.add_child(child)
					
		if event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
			if not Orphanage.empty() and hovered:
				var child = Orphanage.get_child(0)
				
				# ItemEquipResult class contains item
				# and if it was successfully equipped
				# if not, item is returned to old position
				
				if child is ItemSlot:
					print("child is item slot")
					var itemResult = ItemEquipResult.new(child.item)
					on_item_release.emit(itemResult)
					if itemResult.isSuccess:
						print("item equiped")
						
						# move the item after success
						Orphanage.remove_child(child)
						add_child(child)
						child.position = Vector2.ZERO
						
					else:
						print("cant do that")
