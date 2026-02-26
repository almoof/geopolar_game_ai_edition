extends CharacterBody2D


const SPEED = 100.0


func _physics_process(delta: float) -> void:


	var directionHor := Input.get_axis("ui_left", "ui_right")
	var directionVer := Input.get_axis("ui_up", "ui_down")
	if directionHor:
		velocity.x = directionHor
	else:
		velocity.x = directionHor
	if directionVer:
		velocity.y = directionVer
	else:
		velocity.y = directionVer
	velocity = velocity.normalized()
	velocity *= SPEED
	print(velocity)

	move_and_slide()
