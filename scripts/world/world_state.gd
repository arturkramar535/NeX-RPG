extends Node

var current_day: int = 1
var current_hour: int = 8
var current_minute: int = 0


func get_time_string() -> String:
	return "%02d:%02d" % [current_hour, current_minute]


func advance_minutes(minutes: int) -> void:
	if minutes <= 0:
		return

	current_minute += minutes

	while current_minute >= 60:
		current_minute -= 60
		current_hour += 1

	while current_hour >= 24:
		current_hour -= 24
		current_day += 1


func get_day() -> int:
	return current_day
