extends Node

func get_item_texture(path: String) -> Texture2D:
	var res = load("res://Resources/" + path + ".png")
	return res
