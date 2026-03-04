extends Card

var hp = 100

func _ready() -> void:
	damage = 3
	isSelected = false
	rarity = Type.DEFAULT
	$"../HP text".text = str(hp)

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


func _on_button_pressed() -> void:
	if isSelected:
		hp -= damage
		$"../HP text".text = str(hp)
		isSelected = false
		position.y += 10
	else:
		print("select a card")
		
