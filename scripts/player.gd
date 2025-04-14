extends CharacterBody2D

@onready var tile_map: TileMapLayer = get_parent()

var is_moving: bool = false
var target_position: Vector2
var direction: Vector2

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_north"):
		target_position = global_position - Vector2(0, 32)
		direction = Vector2(0, -32)
		is_moving = true
	if event.is_action_pressed("move_northeast"):
		target_position = global_position + Vector2(32, -32)
		direction = Vector2(32, -32)
		is_moving = true
	if event.is_action_pressed("move_east"):
		target_position = global_position + Vector2(32, 0)
		direction = Vector2(32, 0)
		is_moving = true
	if event.is_action_pressed("move_southeast"):
		target_position = global_position + Vector2(32, 32)
		direction = Vector2(32, 32)
		is_moving = true
	if event.is_action_pressed("move_south"):
		target_position = global_position + Vector2(0, 32)
		direction = Vector2(0, 32)
		is_moving = true
	if event.is_action_pressed("move_southwest"):
		target_position = global_position + Vector2(-32, 32)
		direction = Vector2(-32, 32)
		is_moving = true
	if event.is_action_pressed("move_west"):
		target_position = global_position - Vector2(32, 0)
		direction = Vector2(-32, 0)
		is_moving = true
	if event.is_action_pressed("move_northwest"):
		target_position = global_position - Vector2(32, 32)
		direction = Vector2(-32, -32)
		is_moving = true
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	if is_moving == false:
		return
	if is_moving:
		var cell_tile_data = tile_map.local_to_map(target_position)
		move_and_slide()
		global_position = global_position.move_toward(target_position, 5)
	if global_position == target_position:
		is_moving = false
