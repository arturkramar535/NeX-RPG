extends CharacterBody3D

## Basic third-person player controller.
## Input is handled through the global InputManager.

@export var movement_speed: float = 5.0
@export var character_data: CharacterData

@onready var camera_pivot: Node3D = $CameraPivot
@onready var character_visual: CharacterVisual = $CharacterVisual
func _ready() -> void:
	if character_data != null:
		print("Character loaded: " + character_data.character_name)
		print("Race: " + character_data.race)
		print("Gender: " + character_data.gender)
		character_visual.setup(character_data.appearance)
func _physics_process(_delta: float) -> void:
	var input_direction := InputManager.get_movement_vector()
	var camera_basis := camera_pivot.global_transform.basis
	var forward := camera_basis.z
	var right := camera_basis.x
	
	forward.y = 0.0
	right.y = 0.0
	
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
