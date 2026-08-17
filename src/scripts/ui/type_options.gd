extends HBoxContainer

var should_change : bool = true
var type_layer : String = ""
var type : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globalsignals.deselected.connect(update_data)
	Globalsignals.attribute_selected.connect(update_data)
	%Label.text = type_layer

func populate_option(pet_types : Dictionary):
	%OptionButton.clear()
	var index : int = 0
	for i in pet_types.get(type_layer, []):
		%OptionButton.add_item(i)
		%OptionButton.set_item_metadata(index, i)
		index += 1

func update_data():
	should_change = false
	%OptionButton.disabled = true
	
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return

	var test : Array = item['data'].types.get(type_layer, [])
	var has_data : String = 'default' if test.is_empty() else test[0]
	for i in %OptionButton.item_count:
		if type_layer == 'special' && has_data == 'default':
			%OptionButton.select(0)
			break
		
		if %OptionButton.get_item_metadata(i) == has_data:
			%OptionButton.select(i)
			break
	%OptionButton.disabled = false
	should_change = true

func _on_option_button_item_selected(index: int) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		var meta_data = %OptionButton.get_item_metadata(index)
		if meta_data == null : return
		if type_layer == 'special' && meta_data == 'None':
			item['data'].types[type_layer] = []
		else:
			item['data'].types[type_layer] = [meta_data]
	
	Globalsignals.check_part_special.emit()
