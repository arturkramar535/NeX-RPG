extends Area3D

@export var npc_name: String = "Elena"

var player_inside: bool = false


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("interact"):
		interact()


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_inside = true
		print("Player entered interaction range: " + npc_name)


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_inside = false
		print("Player left interaction range: " + npc_name)


func interact() -> void:
	DialogueManager.start_dialogue(
		npc_name,
		"Ты здесь недавно, не так ли?"
	)
