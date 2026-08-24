class_name CharacterAnimationController
extends Node

## Controls the animation state of a character.
## The actual animation assets are connected separately.

enum AnimationState {
	IDLE,
	WALK,
	RUN
}

var current_state: AnimationState = AnimationState.IDLE


func set_state(new_state: AnimationState) -> void:
	if current_state == new_state:
		return

	current_state = new_state

	match current_state:
		AnimationState.IDLE:
			print("Animation state: IDLE")

		AnimationState.WALK:
			print("Animation state: WALK")

		AnimationState.RUN:
			print("Animation state: RUN")
