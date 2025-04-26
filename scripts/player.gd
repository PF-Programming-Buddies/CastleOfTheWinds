extends CharacterBody2D
class_name Test_Player
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

var movement_speed = 200.0

var touching_character = false

func move_to(coordinates):
	snap_pos()
	var query = PhysicsPointQueryParameters2D.new()
	query.position = coordinates
	query.collide_with_bodies = true
	var results = get_world_2d().direct_space_state.intersect_point(query)
	for hit in results:
		if hit and hit.collider is CharacterBody2D:
			return
	navigation_agent_2d.target_position = coordinates

func _physics_process(delta: float) -> void:
	var current_agent_position = global_position
	var next_path_position = navigation_agent_2d.get_next_path_position()
	var new_velocity = current_agent_position.direction_to((next_path_position)) * movement_speed
	# the navigation has ended
	if navigation_agent_2d.is_navigation_finished():
		return
	
	if navigation_agent_2d.is_target_reachable():
		velocity = new_velocity
	
	move_and_slide()
	
func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity.move_toward(velocity, 0.25)

func _on_pathing_move_to(coordinate):
	move_to(coordinate)

func snap_pos():
	global_position = global_position.snapped(Vector2(16, 16))

# snaps the position to the nearest cell on destination reached
func _on_navigation_agent_2d_target_reached():
	snap_pos()

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		# we need to stop moving to that square!
		touching_character = true
		snap_pos()

func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		# we need to stop moving to that square!
		touching_character = false

func _on_navigation_agent_2d_waypoint_reached(details):
	if touching_character:
		move_to(details.position)
