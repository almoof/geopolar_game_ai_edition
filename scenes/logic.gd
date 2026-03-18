extends Node

var hp = 100
var damage = 0
var susceptivity = 1
var cards_to_play: Array[String] = []
var slots: Array[String] = []
var slots_inst: Array[Card] = []
var damageCardScene = preload("res://scenes/damage_card.tscn")
var pineCardScene = preload("res://scenes/pine_card.tscn")

var deck: Array[String] = ["damage_card", "damage_card", "damage_card", "damage_card", "pine_card", "pine_card"]
var discard_deck: Array[String] = []
var slots_num = 4

func _ready() -> void:
	$"../HP text".text = str(hp)
	$"../Deck size".text = str(deck.size())
	fill_slots()
	

func fill_slots() -> void:
	slots.clear()
	randomize()
	if deck.size() == 0:
		return
	elif slots_num > deck.size():
		slots_num = deck.size()
	for i in slots_num:
		var random_card = deck.pick_random()
		slots.append(random_card)
		deck.erase(random_card)
		#print(slots)
	instantiate_slots()

func instantiate_slots() -> void:
	for i in slots_num:
		match slots[i]:
			"damage_card":
				var cardInstance = damageCardScene.instantiate() as Damage_Card
				add_child(cardInstance)
				cardInstance.global_position = Vector2((i+1)*200, 430)
				cardInstance.scale = Vector2(0.583, 0.583)
				slots_inst.append(cardInstance)
				#print("1")
			"pine_card":
				var cardInstance = pineCardScene.instantiate() as Pine_Card
				add_child(cardInstance)
				cardInstance.global_position = Vector2((i+1)*200, 430)
				cardInstance.scale = Vector2(0.583, 0.583)
				slots_inst.append(cardInstance)
				#print("2")
	#print("array -", slots_inst)
func _on_button_pressed() -> void:
	#print("bylo ->", slots_inst)
	for card in slots_inst:
		if card.isSelected:
			cards_to_play.append(check_id(card))
			card.isSelected = false
			card.position.y += 10
			#print("added")
			card.queue_free()
		else:
			deck.append(check_id(card))
			card.queue_free()
	slots_inst.clear()
			
	#print("cards to plat", cards_to_play)
	play_cards()
	discard_cards()
	
	fill_slots()
	#instantiate_slots()
	print("discard deck ", discard_deck)
	print("stalo -> ", slots_inst)
	#print("slots", slots)
	print("deck ", deck)
	

func discard_cards() -> void:
	for card in cards_to_play:
		discard_deck.append(card)
	cards_to_play.clear()

func check_id(card: Card) -> String:
	match card.id:
		0: return "damage_card"
		1: return "pine_card"
		_: return "none"
		
func play_cards() -> void:
	for card in cards_to_play:
		if card == "damage_card":
			damage += 3
		if card == "pine_card":
			susceptivity *= 2
	hp -= damage * susceptivity
	$"../HP text".text = str(hp)
	$"../Deck size".text = str(deck.size())
	damage = 0
	susceptivity = 1
	#cards_to_play.clear()
