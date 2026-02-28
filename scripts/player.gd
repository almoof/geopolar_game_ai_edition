extends CharacterBody2D


const SPEED = 50
var input_dir = Vector2.ZERO
var movement_dir = ""

func _ready() -> void:
	$AnimatedSprite2D.play("idle_down")

func _physics_process(delta: float) -> void:
	move_and_slide()
	player_movement()

func player_movement() -> void:
	input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED

func movement_direction() -> void:
	if Input.is_action_pressed("left"):
		movement_dir = "left"
	elif Input.is_action_pressed("right"):
		movement_dir = "right"
	elif Input.is_action_pressed("up"):
		movement_dir = "up"
	elif Input.is_action_pressed("down"):
		movement_dir = "down"
