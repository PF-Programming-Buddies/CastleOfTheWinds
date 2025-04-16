extends CanvasLayer

@onready var inventory = $UI/Inventory

func get_active_ui():
	var ui = $UI
	for i in range(len(ui.get_children())):
		var control = ui.get_child(i) as Control
		if control:
			if control.name != "Menu" and control.visible:
				return control
	return null

func close_active_ui():
	get_tree().paused = false
	var control = get_active_ui()
	if control:
		control.visible = false

func _on_close_pressed():
	close_active_ui()

func _on_inventory_pressed():
	get_tree().paused = not get_tree().paused
	inventory.visible = not inventory.visible
