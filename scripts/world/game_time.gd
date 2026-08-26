
extends Node

## Controls the in-game day and time.

signal time_changed(hour: int, minute: int)
signal day_changed(day: int)

@export var start_day: int = 1
@export var start_hour: int = 8
@export var start_minute: int = 0

var current_day: int
var current_hour: int
var current_minute: int


func _ready() -> void:
	current_day = start_day
	current_hour = start_hour
	current_minute = start_minute


func set_time(day: int, hour: int, minute: int) -> void:
	current_day = day
	current_hour = hour
	current_minute = minute

	_normalize_time()

	time_changed.emit(current_hour, current_minute)
	day_changed.emit(current_day)


func advance_minutes(minutes: int) -> void:
	if minutes < 0:
		return

	current_minute += minutes

	_normalize_time()

	time_changed.emit(current_hour, current_minute)


func _normalize_time() -> void:
	while current_minute >= 60:
		current_minute -= 60
		current_hour += 1

	while current_hour >= 24:
		current_hour -= 24
		current_day += 1
		day_changed.emit(current_day)


func get_time_string() -> String:
	return "%02d:%02d" % [current_hour, current_minute]
