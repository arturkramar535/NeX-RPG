extends Node

## Handles transitions between major game scenes.

var current_scene: Node = null


func change_scene(scene_path: String) -> void:
	if not ResourceLoader.exists(scene_path):
		push_error("Scene not found: " + scene_path)
		return

	var new_scene: PackedScene = load(scene_path)

	if new_scene == null:
		push_error("Failed to load scene: " + scene_path)
		return

	if current_scene != null:
		current_scene.queue_free()

	current_scene = new_scene.instantiate()
	get_tree().root.add_child(current_scene)

	print("Scene changed to: " + scene_path)
