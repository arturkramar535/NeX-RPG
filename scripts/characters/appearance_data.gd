class_name AppearanceData
extends Resource

## Visual configuration of a character.
## It contains references/identifiers for the visual components,
## but does not contain the actual 3D models.

@export_category("Body")

@export var body_type: String = "default"
@export var body_height: float = 1.0
@export var body_build: String = "default"

@export_category("Face")

@export var face_type: String = "default"
@export var eye_type: String = "default"
@export var eye_color: String = "default"

@export_category("Hair")

@export var hair_style: String = "default"
@export var hair_color: String = "default"

@export_category("Skin")

@export var skin_type: String = "default"

@export_category("Outfit")

@export var outfit: String = "default"
