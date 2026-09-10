extends Control


func _ready() -> void:
	Globalsignals.recolor_part.connect(recolor_part)

func recolor_part():
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return
	var selected_data : Attirbute = item.get('data')
	
	if selected_data == null or !is_instance_valid(selected_data): return
	if selected_data is not Attirbute.TurkeyAttirbutes: return
	%Tail.self_modulate = selected_data.base_layers['tail']
	%Body.self_modulate = selected_data.base_layers['body']
	%Legs.self_modulate = selected_data.base_layers['leg']
	%Head.self_modulate = selected_data.base_layers['head']
	%Mouth.self_modulate = selected_data.base_layers['mouth']
	
	%TailInner.self_modulate = selected_data.color_layers['tailDark']
	%BodyFeathers.self_modulate = selected_data.color_layers['bodyFeathers']
	%Wing.self_modulate = selected_data.color_layers['wing']
	%WingLines.self_modulate = selected_data.color_layers['wingLines']
	%WingLight.self_modulate = selected_data.color_layers['wingLight']
	
	%Beak.self_modulate = selected_data.color_layers['beakTop']
	%Snood.self_modulate = selected_data.color_layers['snood']
	%Eyebrows.self_modulate = selected_data.color_layers['brow']
	
	%Eyeline.self_modulate = selected_data.color_layers['eyeShadow']
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']
