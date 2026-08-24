class_name CharacterData
extends Resource

## Base data describing a character.

@export_category("Identity")

@export var character_name: String = "Unknown"
@export var race: String = "Human"
@export var gender: String = "Unknown"

@export_category("Basic Stats")

@export var level: int = 1
@export var experience: int = 0

@export_category("Appearance")

@export var appearance: AppearanceData
