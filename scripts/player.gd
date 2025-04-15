extends CharacterBody2D
class_name Test_Player
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
#@onready var tile_map = $"../Pathing"

#
#var astar_grid: AStarGrid2D
#var current_id_path: Array[Vector2i]
#var current_point_path: PackedVector2Array
#var target_position: Vector2
#var is_moving: bool
#
#
#func _ready() -> void:
	#astar_grid = AStarGrid2D.new()
	#astar_grid.region = tile_map.get_used_rect()
	#astar_grid.cell_size = Vector2(16,16)
	#astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ALWAYS
	#astar_grid.update()
	#
	#for x in tile_map.get_used_rect().size.x:
		#for y in tile_map.get_used_rect().size.y:
			#var tile_position = Vector2i(
				#x + tile_map.get_used_rect().position.x,
				#y + tile_map.get_used_rect().position.y
			#)
			#
			#var tile_data = tile_map.get_cell_tile_data(tile_position)
			#
			#if tile_data == null or tile_data.get_custom_data("walkable") == false:
				#astar_grid.set_point_solid(tile_position)
	#
	#
#func _input(event):
	#if event.is_action_pressed("move") == false:
		#return
		#
	#var id_path
	#
	#if is_moving:
		#id_path = astar_grid.get_id_path(
			#tile_map.local_to_map(target_position),
			#tile_map.local_to_map(get_global_mouse_position())
		#).slice(1)
	#else:
		#id_path = astar_grid.get_id_path(
			#tile_map.local_to_map(global_position),
			#tile_map.local_to_map(get_global_mouse_position())
		#).slice(1)
		#
	#if id_path.is_empty() == false:
		#current_id_path = id_path
		#
	#current_point_path = astar_grid.get_point_path(
		#tile_map.local_to_map(target_position),
		#tile_map.local_to_map(get_global_mouse_position())
	#)
	#
	#for i in current_point_path.size():
		#current_point_path[i] = current_point_path[i] + Vector2(8,8)
#
#func _physics_process(delta: float) -> void:
	#if current_id_path.is_empty():
		#return
	#
	#if is_moving == false:
		#target_position = tile_map.map_to_local(current_id_path.front())
		#is_moving = true
	#
	#global_position = global_position.move_toward(target_position, 5)
	#
	#if global_position == target_position:
		#current_id_path.pop_front()
		#
		#if current_id_path.is_empty() == false:
			#target_position = tile_map.map_to_local(current_id_path.front())
		#else:
			#is_moving = false


var movement_speed = 250.0

func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	navigation_agent_2d.target_position = mouse_position
	
	var current_agent_position = global_position
	var next_path_position = navigation_agent_2d.get_next_path_position()
	var new_velocity = current_agent_position.direction_to((next_path_position)) * movement_speed
	# the navigation has ended
	if navigation_agent_2d.is_navigation_finished():
		return
	
	velocity = new_velocity
	
	move_and_slide()
	
func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
