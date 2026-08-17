extends CheckBox

var should_change : bool = true
var type_layer : String = ""
var type : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globalsignals.attribute_selected.connect(update_data)
	text = type_layer + "_" + type

func update_data():
	if DataCreator.selected_data == null or !is_instance_valid(DataCreator.selected_data) : return
	var test : int = DataCreator.selected_data.types.get(type_layer, []).find(type)
	var has_data : bool = true if test != -1 else false
	button_pressed = has_data

func _toggled(toggled_on: bool) -> void:
	if DataCreator.selected_data == null or !is_instance_valid(DataCreator.selected_data) : return
	var data : Array = DataCreator.selected_data.types.get(type_layer, [])
	if toggled_on:
		if data.find(type) == -1:
			data.append(type)
	else:
		if data.find(type) != -1:
			data.erase(type)
