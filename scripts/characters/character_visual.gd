class_name CharacterVisual
extends Node3D

## Converts AppearanceData into a visual representation.
## Actual 3D assets will be connected later.

var appearance: AppearanceData


func setup(new_appearance: AppearanceData) -> void:
	appearance = new_appearance

	if appearance == null:
		push_warning("CharacterVisual: AppearanceData is missing.")
		return

	print("Character visual configured.")
	print("Body: " + appearance.body_type)
	print("Hair: " + appearance.hair_style)
	print("Eyes: " + appearance.eye_color)
