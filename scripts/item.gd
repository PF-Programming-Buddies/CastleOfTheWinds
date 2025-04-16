class_name Item
extends Resource

@export var item_name: String
@export var sprite: Texture2D = AtlasTexture.new()
@export var identified: bool = false
@export var weight: int
@export var bulk: int
@export var sell_value: int
@export var enchanted: bool
@export var enchanted_level: int
@export var cursed: bool
@export var cursed_level: int
@export var broken: bool
@export var is_sold: bool
@export var can_sell: bool

var item_string: String

func update_item_string(default_name: String):
	var text: String = ""
	if identified:
		if cursed:
			text += "Cursed"
		elif enchanted: 
			text += "Enchanted"
		else:
			text += "Normal"
