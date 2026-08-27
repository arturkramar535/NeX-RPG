extends Node

signal dialogue_started(speaker: String, text: String)
signal dialogue_ended

var dialogue_active: bool = false

var current_dialogue: Array[Dictionary] = []
var current_index: int = 0


func start_dialogue(speaker: String, text: String) -> void:
	current_dialogue = [
		{
			"speaker": speaker,
			"text": text
		},
		{
			"speaker": speaker,
			"text": "Я раньше тебя здесь не видела."
		},
		{
			"speaker": speaker,
			"text": "Если ты ищешь информацию о городе, поговори с трактирщиком."
		}
	]

	current_index = 0
	dialogue_active = true

	_show_current_line()


func _show_current_line() -> void:
	var line: Dictionary = current_dialogue[current_index]

	print("Dialogue line:")
	print(line["speaker"] + ": " + line["text"])

	dialogue_started.emit(
		line["speaker"],
		line["text"]
	)


func next_line() -> void:
	if not dialogue_active:
		return

	current_index += 1

	if current_index >= current_dialogue.size():
		end_dialogue()
		return

	_show_current_line()


func end_dialogue() -> void:
	if not dialogue_active:
		return

	dialogue_active = false
	current_dialogue.clear()
	current_index = 0

	print("Dialogue ended")

	dialogue_ended.emit()
