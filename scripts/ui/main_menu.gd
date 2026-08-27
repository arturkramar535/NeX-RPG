extends Control


@onready var new_game_button: Button = $MenuContainer/NewGameButton
@onready var continue_button: Button = $MenuContainer/ContinueButton
@onready var settings_button: Button = $MenuContainer/SettingsButton
@onready var exit_button: Button = $MenuContainer/ExitButton


func _ready() -> void:
	new_game_button.pressed.connect(_on_new_game_pressed)
	continue_button.pressed.connect(_on_continue_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	exit_button.pressed.connect(_on_exit_pressed)


func _on_new_game_pressed() -> void:
	print("NEW GAME BUTTON PRESSED")
	
	SceneManager.change_scene("res://scenes/ui/character_creation.tscn")

func _on_continue_pressed() -> void:
	print("Continue selected")


func _on_settings_pressed() -> void:
	print("Settings selected")


func _on_exit_pressed() -> void:
	get_tree().quit()
