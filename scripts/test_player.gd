extends CharacterBody2D
class_name Player
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

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
	
	if navigation_agent_2d.avoidance_enabled:
		navigation_agent_2d.velocity = new_velocity
	else:
		_on_navigation_agent_2d_velocity_computed(new_velocity)
	move_and_slide()
	
func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
