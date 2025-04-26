extends CanvasLayer

var old_parent = null

func empty():
	return len(get_children()) == 0

func _input(event):
	if event is InputEventMouseMotion:
		if not empty():
			var child = get_child(0)
			if child is Control:
				child.position = event.position + Vector2(2,2)
	
	if event is InputEventMouseButton:
		if event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
			if not Orphanage.empty() and old_parent:
				var child = Orphanage.get_child(0)
				Orphanage.remove_child(child)
				old_parent.add_child(child)
				child.position = Vector2.ZERO
