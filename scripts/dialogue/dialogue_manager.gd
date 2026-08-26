extends Node

var current_speaker: String = ""
var current_text: String = ""
var dialogue_active: bool = false


func start_dialogue(speaker: String, text: String) -> void:
	current_speaker = speaker
	current_text = text
	dialogue_active = true

	print("Dialogue started")
	print(current_speaker + ": " + current_text)


func end_dialogue() -> void:
	current_speaker = ""
	current_text = ""
	dialogue_active = false

	print("Dialogue ended")
