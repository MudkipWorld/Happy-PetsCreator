extends CheckBox

var should_change : bool = true

var color_layer : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globalsignals.deselected.connect(update_data)
	Globalsignals.attribute_selected.connect(update_data)
	text = color_layer

func update_data():
	should_change = false
	disabled = true
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return
	button_pressed = item['data'].attributes.get(color_layer, false)
	disabled = false
	should_change = true

func _toggled(toggled_on: bool) -> void:
	if !should_change : return
	for item in GlobalData.held_items:
		if item.is_empty() : return
		var val : int  = 1 if toggled_on else 0
		item['data'].attributes.set(color_layer, val)
	
	Globalsignals.check_part.emit()
