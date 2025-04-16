class_name ItemSlot
extends Panel

@export var item: Item
@export var accepted_types:= [Weapon, Helmet, Armor]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	accepted_types.append(Weapon)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
