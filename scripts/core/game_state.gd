extends Node

## Global state of the game.
## Persistent information shared between game systems.

var game_started: bool = false

var player_name: String = ""
var player_race: String = ""
var player_gender: String = ""


func start_new_game(
	new_player_name: String,
	new_player_race: String,
	new_player_gender: String
) -> void:
	game_started = true

	player_name = new_player_name
	player_race = new_player_race
	player_gender = new_player_gender

	print("New game started.")
	print("Player: %s" % player_name)
	print("Race: %s" % player_race)
	print("Gender: %s" % player_gender)
