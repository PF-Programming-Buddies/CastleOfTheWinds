class_name ItemSlot
extends Panel
var hovered = false
@export var item: Item
@export var accepted_type : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			if Orphanage.empty() and hovered:
				var parent = get_parent()
				var old_pos = position
				parent.remove_child(self)
				
				Orphanage.add_child(self)
				Orphanage.old_parent = parent
				
				position = old_pos

func equip(item: Item):
	if item.slot_type == accepted_type:
		# can equiped
		#if item:
			# return to inventory
			# then equip
		pass
	elif accepted_type.is_empty():
		# also can equip
		pass
	else:
		# nah
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered():
	if visible:
		hovered = true

func _on_mouse_exited():
	hovered = false
