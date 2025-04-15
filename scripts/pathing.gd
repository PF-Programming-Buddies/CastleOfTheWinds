extends TileMapLayer

signal move_to(coordinate)

@onready var structures: TileMapLayer = $"../Structures"

func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	if coords in structures.get_used_cells_by_id(0):
		return true
	return false

func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	if coords in structures.get_used_cells_by_id(0):
		tile_data.set_navigation_polygon(0, null)

func _unhandled_input(event):
	if Input.is_action_just_pressed("move"):
		var mouse_position = get_global_mouse_position()
		print(mouse_position)
		var map_coors = map_to_local(local_to_map(mouse_position))
		move_to.emit(map_coors)
