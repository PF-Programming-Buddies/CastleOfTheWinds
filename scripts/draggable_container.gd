extends Control
class_name DraggableDestination

var hovered = false

func _ready():
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	
func on_mouse_entered():
	hovered = true
	
func on_mouse_exited():
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
				Orphanage.remove_child(child)
				
				add_child(child)
				child.position = Vector2.ZERO
