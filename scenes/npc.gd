extends CharacterBody2D

var isInArea = false


func _ready() -> void:
	$AnimatedSprite2D.play("idle_down")


func _input(event: InputEvent) -> void:
	if isInArea and event.is_action_pressed("interact"):
		print("youu")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		isInArea = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		isInArea = false
