class_name ItemSlot
extends Panel
var hovered = false
@export var item: Item

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = randf()
	var g = randf()
	var b = randf()
	$VBoxContainer/Label.self_modulate = Color(r, g,b)
	
	item = Item.new()
	var slot_name = Item.SlotType.keys().pick_random()
	item.slot_type = Item.SlotType[slot_name]
	tooltip_text = str(slot_name)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			if Orphanage.empty() and hovered:
				var parent = get_parent()
				var old_pos = position
				parent.remove_child(self)
				
				Orphanage.add_child(self)
				Orphanage.old_parent = parent
				
				global_position = get_viewport().get_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered():
	if visible:
		hovered = true

func _on_mouse_exited():
	hovered = false
