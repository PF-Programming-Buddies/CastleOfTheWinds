extends Label

var hovered = false

func _on_mouse_entered():
	hovered = true

func _on_mouse_exited():
	hovered = false
	
func _input(event):
	if event is InputEventMouseButton:
		if hovered and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			var container = get_node("%ScrollContainer")
			
			if container.visible:
				container.visible = false
				$"../..".size_flags_vertical = SizeFlags.SIZE_SHRINK_BEGIN
			else:
				$"../..".size_flags_vertical = SizeFlags.SIZE_EXPAND_FILL
				container.visible = true
