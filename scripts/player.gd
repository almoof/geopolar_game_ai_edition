extends CharacterBody2D


const SPEED = 150.0


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionHor := Input.get_axis("ui_left", "ui_right")
	var directionVer := Input.get_axis("ui_up", "ui_down")
	if directionHor:
		velocity.x = directionHor * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionVer:
		velocity.y = directionVer * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
