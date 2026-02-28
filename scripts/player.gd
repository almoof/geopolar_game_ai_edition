extends CharacterBody2D


const SPEED = 50
var input_dir = Vector2.ZERO
var movement_dir = ""
var is_moving = false
@onready var player = $AnimatedSprite2D

func _ready() -> void:
	player.play("idle_down")

func _physics_process(delta: float) -> void:
	move_and_slide()
	player_movement()
	movement_direction()
	player_animation()
	print(input_dir)

func player_movement() -> void:
	input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED

func movement_direction() -> void:
	is_moving = true
	if input_dir == Vector2(-1, 0):
		movement_dir = "left"
	elif input_dir == Vector2(1, 0):
		movement_dir = "right"
	elif input_dir == Vector2(0, -1):
		movement_dir = "up"
	elif input_dir == Vector2(0, 1):
		movement_dir = "down"
	elif input_dir == Vector2(-sqrt(0.5), -sqrt(0.5)):
		movement_dir = "upleft"
	elif input_dir == Vector2(-sqrt(0.5), sqrt(0.5)):
		movement_dir = "downleft"
	elif input_dir == Vector2(sqrt(0.5), -sqrt(0.5)):
		movement_dir = "upright"
	elif input_dir == Vector2(sqrt(0.5), sqrt(0.5)):
		movement_dir = "downright"
	else:
		is_moving = false

func player_animation() -> void:
	if movement_dir == "left" and is_moving == true:
		player.play("walk_side")
		player.flip_h = true
	elif movement_dir == "right" and is_moving == true:
		player.play("walk_side")
		player.flip_h = false
	elif movement_dir == "up" and is_moving == true:
		player.play("walk_up")
	elif movement_dir == "down" and is_moving == true:
		player.play("walk_down")
		
	elif movement_dir == "upleft" and is_moving == true:
		player.play("walk_upside")
		player.flip_h = true
	elif movement_dir == "upright" and is_moving == true:
		player.play("walk_upside")
		player.flip_h = false
	elif movement_dir == "downleft" and is_moving == true:
		player.play("walk_downside")
		player.flip_h = true
	elif movement_dir == "downright" and is_moving == true:
		player.play("walk_downside")
		player.flip_h = false
		
	elif movement_dir == "left" and is_moving == false:
		player.play("idle_side")
		player.flip_h = true
	elif movement_dir == "right" and is_moving == false:
		player.play("idle_side")
		player.flip_h = false
	elif movement_dir == "up" and is_moving == false:
		player.play("idle_up")
	elif movement_dir == "down" and is_moving == false:
		player.play("idle_down")
	elif movement_dir == "upleft" and is_moving == false:
		player.play("idle_upside")
		player.flip_h = true
	elif movement_dir == "upright" and is_moving == false:
		player.play("idle_upside")
		player.flip_h = false
	elif movement_dir == "downleft" and is_moving == false:
		player.play("idle_downside")
		player.flip_h = true
	elif movement_dir == "downright" and is_moving == false:
		player.play("idle_downside")
		player.flip_h = false
