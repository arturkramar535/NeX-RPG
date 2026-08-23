extends Node

## Main controller of the NeX-RPG project.

func _ready() -> void:
	print("NeX-RPG GameManager initialized.")
	GameState.start_new_game()
