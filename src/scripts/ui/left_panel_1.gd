extends Panel

var should_change : bool = true
var color_box : PackedScene = preload("res://ui/color_box.tscn")
var attributes_check : PackedScene = preload("res://ui/attributes_check.tscn")
var type_option : PackedScene = preload("res://ui/type_options.tscn")

var cache : Dictionary[GlobalData.PetType, Attirbute] = {}

func _ready() -> void:
	Globalsignals.deselected.connect(update_data)
	Globalsignals.attribute_selected.connect(update_data)
	GlobalData.add_to_ui = self

func add_ui_pet(type : GlobalData.PetType):
	for i in %ColorsData.get_children():
		i.queue_free()
		
	for i in %AttributesData.get_children():
		i.queue_free()
		
	for i in %TypesData.get_children():
		i.queue_free()
	
	var selected_class = null
	var attribute_class : Attirbute 
	
	if cache.has(type):
		attribute_class = cache.get(type, null)
	else:
		var pet_type : Dictionary = GlobalData.pet_map.get(type, {})
		selected_class = pet_type.get('attribute', null)
		if selected_class == null: return
		attribute_class = selected_class.new()
		attribute_class.attributes.sort()
		attribute_class.color_layers.sort()
		attribute_class.base_layers.sort()
		cache[type] = attribute_class

	
	for i in attribute_class.base_layers.keys():
		var spawn = color_box.instantiate()
		spawn.color_layer = i
		spawn.color = attribute_class.base_layers[i]
		%ColorsData.add_child(spawn)
		
	for i in attribute_class.color_layers.keys():
		var spawn = color_box.instantiate()
		spawn.color_layer = i
		spawn.color = attribute_class.color_layers[i]
		%ColorsData.add_child(spawn)

	for i in attribute_class.attributes.keys():
		if i == 'scale' : continue
		if i == 'vampireNightItem' : continue
		var spawn = attributes_check.instantiate()
		spawn.color_layer = i
		%AttributesData.add_child(spawn)

	for i in attribute_class.pet_types.keys():
		var spawn = type_option.instantiate()
		spawn.type_layer = i
		spawn.populate_option(attribute_class.pet_types)
		%TypesData.add_child(spawn)

func update_data():
	should_change = false
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return
	%VampItemName.text = item['data'].attributes.get('vampireNightItem', '')
	should_change = true

func _on_vamp_item_name_text_changed(new_text: String) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : 
			if item['data'].attributes.has('vampireNightItem'):
				item['data'].attributes.erase('vampireNightItem')
			return
		item['data'].attributes['vampireNightItem'] = new_text
	
	Globalsignals.check_part.emit()
