extends Control


@export_file("*.json") var d_file

var dialogue = []
var id = -1
var d_active = false
signal dialogue_finished

func _ready() -> void:
	$NinePatchRect.visible = false

func start():
	if d_active:
		return
	d_active = true
	$NinePatchRect.visible = true
	dialogue = load_dialogue()
	next_script()

func load_dialogue():
	var file = FileAccess.open("res://dialogue/ary_dialogue.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and d_active:
		next_script()
	
func next_script():
	id += 1
	if id >= len(dialogue): # here script ends
		d_active = false
		$NinePatchRect.visible = false
		emit_signal("dialogue_finished")
	else:
		$NinePatchRect/Name.text = dialogue[id]['name']
		$NinePatchRect/Text.text = dialogue[id]['text']
