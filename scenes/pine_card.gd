extends Card

class_name Pine_Card

func _ready() -> void:
	damage = 0
	isSelected = false
	rarity = Type.RARE
	id = 1
	




		


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and !isSelected:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT and event.pressed:
			print("selected")
			isSelected = true
			position.y -= 10
	elif event is InputEventMouseButton and isSelected:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT and event.pressed:
			print("not selected")
			isSelected = false
			position.y += 10
