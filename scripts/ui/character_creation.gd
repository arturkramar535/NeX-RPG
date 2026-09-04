extends Control

@onready var hover_sound_player: AudioStreamPlayer = $HoverSoundPlayer
@onready var name_input: LineEdit = $NameInput
@onready var race_option: OptionButton = $RaceOption
@onready var gender_option: OptionButton = $GenderOption
@onready var start_button: Button = $StartButton


func _ready() -> void:
	print("CharacterCreation initialized.")

	print("Start button found: ", start_button != null)
	print("Name input found: ", name_input != null)
	print("Race option found: ", race_option != null)
	print("Gender option found: ", gender_option != null)

	if race_option.item_count > 0:
		race_option.select(0)

	if gender_option.item_count > 0:
		gender_option.select(0)

	start_button.pressed.connect(_on_start_pressed)

	print("Start button signal connected.")
	
	for child in _find_interactive_nodes(self):
		child.mouse_entered.connect(_on_element_hovered)


func _on_start_pressed() -> void:
	print("START GAME BUTTON PRESSED")

	var player_name := name_input.text.strip_edges()

	if player_name.is_empty():
		player_name = "Player"

	if race_option.selected < 0:
		print("ERROR: No race selected.")
		return

	if gender_option.selected < 0:
		print("ERROR: No gender selected.")
		return

	var race := race_option.get_item_text(race_option.selected)
	var gender := gender_option.get_item_text(gender_option.selected)

	print("Character creation:")
	print("Name: " + player_name)
	print("Race: " + race)
	print("Gender: " + gender)

	GameState.start_new_game(
		player_name,
		race,
		gender
	)
	print("GameState updated.")
	print("Loading World...")

	SceneManager.change_scene("res://scenes/world/World.tscn")

func _on_element_hovered() -> void:
	if hover_sound_player and not hover_sound_player.playing:
		hover_sound_player.play()

func _find_interactive_nodes(node: Node) -> Array:
	var elements = []
	if node is Button or node is OptionButton:
		elements.append(node)
	for child in node.get_children():
		elements.append_array(_find_interactive_nodes(child))
	return elements
