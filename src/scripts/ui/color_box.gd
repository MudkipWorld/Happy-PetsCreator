extends HBoxContainer

var should_change : bool = true

var color_layer : String = ""
var color : Color = Color.WHITE_SMOKE

func _ready() -> void:
	Globalsignals.deselected.connect(update_data)
	Globalsignals.attribute_selected.connect(update_data)
	%Label.text = color_layer
	%ColorPickerButton.color = color

func _on_color_picker_button_color_changed(ncolor: Color) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		
		if item['data'].base_layers.has(color_layer):
			item['data'].base_layers[color_layer] = ncolor
			
		elif item['data'].color_layers.has(color_layer):
			item['data'].color_layers[color_layer] = ncolor
		
	Globalsignals.recolor_part.emit()

func update_data():
	%ColorPickerButton.disabled = true
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]
	should_change = false
	
	if item['data'].base_layers.has(color_layer):
		%ColorPickerButton.color = item['data'].base_layers[color_layer]
		
	elif item['data'].color_layers.has(color_layer):
		%ColorPickerButton.color = item['data'].color_layers[color_layer]
	
	should_change = true
	%ColorPickerButton.disabled = false
