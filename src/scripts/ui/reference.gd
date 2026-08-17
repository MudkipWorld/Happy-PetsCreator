extends Control

var should_change : bool = true

func _ready() -> void:
	Globalsignals.reference_loaded.connect(set_reference)
	Globalsignals.attribute_selected.connect(update_ui)

func set_reference(tex : Texture2D):
	%TextureRect.texture = tex

func update_ui():
	should_change = false
	%Coin.editable = false
	%Cash.editable = false
	%Age.editable = false
	%Hunger.editable = false
	%MinLevel.editable = false
	%Tickets.editable = false
	%SizeModier.editable = false
	
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]

	if item.is_empty() : return
	%Coin.value = item.get('cost', 100)
	%Cash.value = item.get('ap_cost', 0)
	%Age.value = item.get('age_per_level', 7200)
	%Hunger.value = item.get('max_hunger', 14400)
	%MinLevel.value = item.get('min_level', 1)
	%Tickets.value = item.get('ticket_cost', 1)
	%SizeModier.value = item['data'].attributes.get('scale', 100)

	if is_zero_approx(%Tickets.value):
		item.set('flags', 0)
	else:
		item.set('flags', 64)

	%Coin.editable = true
	%Cash.editable = true
	%Age.editable = true
	%Hunger.editable = true
	%MinLevel.editable = true
	%Tickets.editable = true
	%SizeModier.editable = true
	should_change = true

func _on_coin_value_changed(value: float) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		item.set('cost', int(value))

func _on_cash_value_changed(value: float) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		item.set('ap_cost', int(value))

func _on_age_value_changed(value: float) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		item.set('age_per_level', int(value))

func _on_hunger_value_changed(value: float) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		item.set('max_hunger', int(value))

func _on_min_level_value_changed(value: float) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		item.set('min_level', int(value))

func _on_tickets_value_changed(value: float) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		item.set('ticket_cost', int(value))
		if is_zero_approx(value):
			item.set('flags', 0)
		else:
			item.set('flags', 64)

func _on_size_modier_value_changed(value: float) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.get('data') == null : return
		item['data'].attributes.set('scale', int(value))
