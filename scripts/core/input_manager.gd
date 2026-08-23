extends Node

## Centralized input layer for PC, Android and gamepads.

func get_movement_vector() -> Vector2:
	var direction := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
        "move_down"
	)

	return direction
