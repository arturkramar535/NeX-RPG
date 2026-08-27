extends Control

@onready var interaction_hint: Panel = $InteractionHint


func show_interaction_hint() -> void:
	interaction_hint.visible = true


func hide_interaction_hint() -> void:
	interaction_hint.visible = false
