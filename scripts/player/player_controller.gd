extends CharacterBody3D

## Basic third-person player controller.

@export var movement_speed: float = 5.0

@onready var camera_pivot: Node3D = $CameraPivot


func _physics_process(_delta: float) -> void:
	var input_direction := InputManager.get_movement_vector()

	var camera_basis := camera_pivot.global_transform.basis

	var forward := -camera_basis.z
	var right := camera_basis.x

	forward.y = 0.0
	right.y = 0.0

	forward = forward.normalized()
	right = right.normalized()

	var direction := (
		right * input_direction.x
		+ forward * input_direction.y
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
