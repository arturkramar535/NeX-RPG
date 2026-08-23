extends Node

## Global state of the game.
## This will eventually contain player, world,
## quest, relationship and other persistent information.

var game_started: bool = false

var player_name: String = ""
var player_race: String = ""
var player_gender: String = ""

func start_new_game() -> void:
	game_started = true

	player_name = "Unknown"
	player_race = "Unknown"
	player_gender = "Unknown"

	print("New game started.")
	print("Player: %s" % player_name)
	print("Race: %s" % player_race)
	print("Gender: %s" % player_gender)
