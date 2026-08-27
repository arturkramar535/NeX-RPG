extends Control

@export var dialogue_panel: Panel
@export var speaker_label: Label
@export var dialogue_text: Label
@export var continue_button: Button


func _ready() -> void:
	print("DialogueUI initialized")

	dialogue_panel.visible = false

	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

	continue_button.pressed.connect(_on_continue_pressed)

	print("DialogueUI connected to DialogueManager")


func _unhandled_input(event: InputEvent) -> void:
	if not DialogueManager.dialogue_active:
		return

	if event.is_action_pressed("dialogue_continue"):
		_on_continue_pressed()
		get_viewport().set_input_as_handled()

	elif event.is_action_pressed("dialogue_cancel"):
		_close_dialogue()
		get_viewport().set_input_as_handled()


func _on_dialogue_started(speaker: String, text: String) -> void:
	print("DialogueUI received dialogue")
	print("Speaker: " + speaker)
	print("Text: " + text)

	dialogue_panel.visible = true

	speaker_label.text = speaker
	dialogue_text.text = text


func _on_continue_pressed() -> void:
	DialogueManager.next_line()


func _close_dialogue() -> void:
	DialogueManager.end_dialogue()


func _on_dialogue_ended() -> void:
	dialogue_panel.visible = false
