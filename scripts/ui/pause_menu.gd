extends Control


@onready var continue_button: Button = $MenuPanel/VBoxContainer/ContinueButton
@onready var character_button: Button = $MenuPanel/VBoxContainer/CharacterButton
@onready var journal_button: Button = $MenuPanel/VBoxContainer/JournalButton
@onready var save_button: Button = $MenuPanel/VBoxContainer/SaveButton
@onready var settings_button: Button = $MenuPanel/VBoxContainer/SettingsButton
@onready var main_menu_button: Button = $MenuPanel/VBoxContainer/MainMenuButton


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

	visible = false

	continue_button.pressed.connect(_on_continue_pressed)
	character_button.pressed.connect(_on_character_pressed)
	journal_button.pressed.connect(_on_journal_pressed)
	save_button.pressed.connect(_on_save_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)

	print("PauseMenu initialized.")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if visible:
			_close_menu()
		else:
			_open_menu()


func _open_menu() -> void:
	visible = true
	get_tree().paused = true
	print("PAUSE MENU OPENED")


func _close_menu() -> void:
	visible = false
	get_tree().paused = false
	print("PAUSE MENU CLOSED")


func _on_continue_pressed() -> void:
	_close_menu()


func _on_character_pressed() -> void:
	print("Character menu - not implemented")


func _on_journal_pressed() -> void:
	print("Journal - not implemented")


func _on_save_pressed() -> void:
	print("Save system - not implemented")


func _on_settings_pressed() -> void:
	print("Settings - not implemented")


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(
		"res://scenes/ui/MainMenu.tscn"
	)
