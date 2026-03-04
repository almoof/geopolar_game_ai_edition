extends Card


func _ready() -> void:
	damage = 3
	isSelected = false
	rarity = Type.DEFAULT


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT and event.pressed:
			print("clicked")
