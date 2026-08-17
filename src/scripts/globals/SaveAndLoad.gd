extends Node

func save_file(path : String):
	var data : Dictionary = get_data()

	var file = FileAccess.open(path, FileAccess.WRITE)
	var saved_data : String = JSON.stringify(data, "\t")
	file.store_string(saved_data)
	file.flush()
	file.close()

func save_file_separate(path : String):
	var data : Dictionary = get_data()
	var base_path_name : String = path.get_basename()
	for key in data.keys():
		var pet_path_name : String = base_path_name + "_" + key + ".json"
		var pet_data : Dictionary = {
			key : data[key]
		}
		var file = FileAccess.open(pet_path_name, FileAccess.WRITE)
		var saved_data : String = JSON.stringify(pet_data, "\t")
		file.store_string(saved_data)
		file.flush()
		file.close()

func load_file(path : String):
	var file = FileAccess.open(path, FileAccess.READ)
	var str_data : String = file.get_as_text()
	var loaded : Variant = JSON.parse_string(str_data)
	if typeof(loaded) != TYPE_DICTIONARY:
		print("no.")
		return
	
	GlobalData.reset_data()
	
	var data : Dictionary = loaded
	load_pets(data)
	
	GlobalData.left_ui_2.check_type()

func load_data(paths : PackedStringArray):
	for path in paths:
		var file = FileAccess.open(path, FileAccess.READ)
		var str_data : String = file.get_as_text()
		var loaded : Variant = JSON.parse_string(str_data)
		if typeof(loaded) != TYPE_DICTIONARY:
			print("no.")
			return
			
		var data : Dictionary = loaded
		load_pets(data)
	
	GlobalData.left_ui_2.check_type()

func load_reference(path : String):
	var img : Image = Image.load_from_file(path)
	
	if img == null : return
	
	img.fix_alpha_edges()
	var tex = ImageTexture.create_from_image(img)
	
	Globalsignals.reference_loaded.emit(tex)

func get_data() -> Dictionary:
	var data : Dictionary = {}
	for key in GlobalData.pet_map.values():
		for i in key.get('pets_data', []):
			var item : Attirbute = i.get('data', null)
			if item == null : continue
			var dat : Dictionary = item.get_data()
			dat['name'] = i.get('name', 'Placeholder')
			dat['cost'] = i.get('cost',100)
			dat['ap_cost'] = i.get('ap_cost',0)
			
			dat['ticket_cost'] = i.get('ticket_cost',0)
			dat['flags'] = i.get('flags',0)
			
			dat['age_per_level'] = i.get('age_per_level',7200)
			dat['max_hunger'] = i.get('max_hunger',14400)
			dat['min_level'] = i.get('min_level',1)
			var pet_name = key.get('name', null)
			if pet_name == null : continue
			if !data.has(pet_name):
				data[pet_name] = []
			data[pet_name].append(dat)
	return data

static func color_dict_to_color(colors : Dictionary) -> Color:
	var col : Color = Color.WHITE
	col.r = colors.get('r', 1.0)
	col.g = colors.get('g', 1.0)
	col.b = colors.get('b', 1.0)
	col.a = colors.get('a', 1.0)
	return col

#--------------- Load per pet
func load_pets(data : Dictionary):
	for key in GlobalData.pet_map.values():
		var pet_name = key.get('name', null)
		if pet_name == null : continue
		var items : Array = data.get(pet_name, [])
		var attribute_class = key.get('attribute', null)
		var target_array : Array = key.get('pets_data', [])
		if attribute_class == null : continue
		for item  in items:
			var c_data : Attirbute = attribute_class.new()
			target_array.append(load_common(item, c_data))

func load_common(item : Dictionary, c_data : Attirbute) -> Dictionary:
	c_data.types.merge(item.get('types', {}), true)
	c_data.attributes.merge(item.get('attributes', {}), true)
	
	var base_colors : Dictionary = {}
	var color_layers : Dictionary = {}
	
	for l in item.get('base_layers', {}).keys():
		var col = item.get('base_layers', {}).get(l, {})
		base_colors[l] = color_dict_to_color(col)
		
	for l in item.get('color_layers', {}).keys():
		var col = item.get('color_layers', {}).get(l, {})
		color_layers[l] = color_dict_to_color(col)
	
	c_data.base_layers.merge(base_colors, true)
	c_data.color_layers.merge(color_layers, true)
	
	var final_data : Dictionary = {
		'name' : item.get('name', 'Placeholder'),
		'cost' : item.get('cost', 100),
		'ap_cost' : item.get('ap_cost', 0),
		'age_per_level' : item.get('age_per_level', 7200),
		'max_hunger' : item.get('max_hunger', 14400),
		'min_level' : item.get('min_level', 1),
		'ticket_cost' : item.get('ticket_cost',0),
		'flags' : item.get('flags',0),
		'data' : c_data
	}

	return final_data
