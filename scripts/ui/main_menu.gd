extends Control

@onready var hover_sound_player: AudioStreamPlayer = $HoverSoundPlayer
@onready var new_game_button: Button = $MenuContainer/NewGameButton
@onready var continue_button: Button = $MenuContainer/ContinueButton
@onready var settings_button: Button = $MenuContainer/SettingsButton
@onready var exit_button: Button = $MenuContainer/ExitButton


func _ready() -> void:
	new_game_button.pressed.connect(_on_new_game_pressed)
	continue_button.pressed.connect(_on_continue_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	exit_button.pressed.connect(_on_exit_pressed)
	for button in get_tree().get_nodes_in_group("buttons") if get_tree().has_group("buttons") else _find_buttons(self):
			if button is Button:
				button.mouse_entered.connect(_on_button_hovered)


func _on_new_game_pressed() -> void:
	print("NEW GAME BUTTON PRESSED")
	
	SceneManager.change_scene("res://scenes/ui/character_creation.tscn")

func _on_continue_pressed() -> void:
	print("Continue selected")


func _on_settings_pressed() -> void:
	print("Settings selected")


func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_button_hovered() -> void:
	if hover_sound_player and not hover_sound_player.playing:
		hover_sound_player.play()

func _find_buttons(node: Node) -> Array:
	var buttons = []
	if node is Button:
		buttons.append(node)
	for child in node.get_children():
		buttons.append_array(_find_buttons(child))
	return buttons
