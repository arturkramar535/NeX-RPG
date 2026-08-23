extends CharacterBody3D

## Basic player movement controller.
## Input is handled through the global InputManager.

@export var movement_speed: float = 5.0


func _physics_process(_delta: float) -> void:
	var input_direction := InputManager.get_movement_vector()

	var direction := Vector3(
		input_direction.x,
		0.0,
		input_direction.y
	)

	if direction.length() > 1.0:
		direction = direction.normalized()

	velocity.x = direction.x * movement_speed
	velocity.z = direction.z * movement_speed

	if not is_on_floor():
		velocity.y -= 20.0 * _delta
	else:
		velocity.y = 0.0

	move_and_slide()
