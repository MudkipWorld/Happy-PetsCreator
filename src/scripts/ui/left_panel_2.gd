extends Panel


func _ready() -> void:
	for i in GlobalData.PetType.keys():
		%PetOption.add_item(str(i))
	
	GlobalData.left_ui_2 = self
	await get_tree().create_timer(0.1).timeout
	GlobalData.set_held_data(GlobalData.PetType.Cat)
	check_type()

func _on_line_edit_text_changed(new_text: String) -> void:
	for itm in GlobalData.held_items:
		var item : Dictionary = itm
		if item.is_empty() : return
		item.set('name',new_text)
		if %PetsTree.get_root() != null:
			for i in %PetsTree.get_root().get_children():
				if i.get_metadata(0) == item:
					i.set_text(0, new_text)
					break

func _on_pet_option_item_selected(index: int) -> void:
	DataCreator.current_pet = index as GlobalData.PetType
	Globalsignals.pet_type_selected.emit(index)
	GlobalData.set_held_data(index)
	GlobalData.held_items.clear()
	%PetsTree.deselect_all()
	check_type()

func check_type():
	%PetsTree.clear()
	var root : TreeItem = %PetsTree.create_item()
	root.set_text(0,'Pets')
	
	var has_data : Dictionary = GlobalData.pet_map.get(%PetOption.selected, {})
	if has_data.is_empty() : return
	
	populate_options(has_data.get('pets_data', []))

func populate_options(data : Array):
	for i in data:
		var item : TreeItem = %PetsTree.create_item(%PetsTree.get_root())
		item.set_text(0, i.get('name', 'Placeholder'))
		item.set_metadata(0, i)
	GlobalData.add_to_ui.add_ui_pet(DataCreator.current_pet)

func _on_add_data_pressed() -> void:
	GlobalData.create_data(DataCreator.current_pet)
	check_type()

func _on_remove_data_pressed() -> void:
	for itm in GlobalData.held_items:
		GlobalData.remove_data(DataCreator.current_pet, itm)
		check_type()

func _on_pets_tree_multi_selected(item: TreeItem, _column: int, _selected: bool) -> void:
	await get_tree().process_frame
	if %PetsTree.get_root() == null : return
	GlobalData.held_items.clear()
	for i in %PetsTree.get_root().get_children():
		var _item : TreeItem = i
		if _item.is_selected(0) && _item.get_metadata(0) is Dictionary:
			GlobalData.held_items.append(_item.get_metadata(0))
			
	
	if GlobalData.held_items.size() > 0:
		Globalsignals.attribute_selected.emit()
		Globalsignals.attribute_selected.emit()
		Globalsignals.recolor_part.emit()

	%LineEdit.text = item.get_metadata(0).get('name', 'Placeholder') if item.get_metadata(0) != null else 'Placeholder'

func sort_tree_item_children():
	if GlobalData.held_data.is_empty() or GlobalData.held_data.size() < 2: return
	GlobalData.held_data.sort_custom(func(a, b): return a["name"] < b["name"])
	check_type()
	if %PetsTree.get_root() != null:
		for i in %PetsTree.get_root().get_children():
			if i.get_metadata(0) in GlobalData.held_items:
				i.select(0)
				break

func _on_sort_tree_pressed() -> void:
	sort_tree_item_children()

func _on_pets_tree_empty_clicked(_click_position: Vector2, _mouse_button_index: int) -> void:
	GlobalData.held_items.clear()
	%PetsTree.deselect_all()
	Globalsignals.deselected.emit()
