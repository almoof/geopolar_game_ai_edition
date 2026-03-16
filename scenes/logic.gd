extends Node

var hp = 100
var cards_to_play: Array[String] = []

func _ready() -> void:
	$"../HP text".text = str(hp)



func _on_button_pressed() -> void:
	if $"../Card".isSelected:
		cards_to_play.append(check_id($"../Card"))
		$"../Card".isSelected = false
		$"../Card".position.y += 10
		print("added")
	if $"../Card2".isSelected:
		cards_to_play.append(check_id($"../Card2"))
		$"../Card2".isSelected = false
		$"../Card2".position.y += 10
		print("added")
	if $"../Card3".isSelected:
		cards_to_play.append(check_id($"../Card3"))
		$"../Card3".isSelected = false
		$"../Card3".position.y += 10
		print("added")
	print(cards_to_play)
	play_cards()

func check_id(card: Card) -> String:
	match card.id:
		0: return "damage_card"
		_: return "none"
		
func play_cards() -> void:
	for card in cards_to_play:
		if card == "damage_card":
			hp -= 3
			$"../HP text".text = str(hp)
	cards_to_play.clear()
