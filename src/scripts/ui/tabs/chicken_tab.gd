extends Control


func _ready() -> void:
	Globalsignals.recolor_part.connect(recolor_part)

func recolor_part():
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return
	var selected_data : Attirbute = item.get('data')
	
	if selected_data == null or !is_instance_valid(selected_data): return
	if selected_data is not Attirbute.ChickenAttirbutes: return
	%Body.self_modulate = selected_data.base_layers['body']
	%Tail.self_modulate = selected_data.base_layers['tail']
	%Head.self_modulate = selected_data.base_layers['head']
	%Wing.self_modulate = selected_data.base_layers['wing']
	%Legs.self_modulate = selected_data.base_layers['leg']
	%Paws.self_modulate = selected_data.base_layers['foot']
	%Beak.self_modulate = selected_data.base_layers['beakTop']
	%Comb.self_modulate = selected_data.base_layers['comb']
	
	%Legs2.self_modulate = selected_data.color_layers['legLower']
	%Claws.self_modulate = selected_data.color_layers['footToe']
	%WingDark.self_modulate = selected_data.color_layers['wingFeathers']
	
	%BeakLower.self_modulate = selected_data.color_layers['beakLower']
	%Mouth.self_modulate = selected_data.color_layers['beakShadow']
	%Eyebrows.self_modulate = selected_data.color_layers['eyeBrow']
	
	%Eyeline.self_modulate = selected_data.color_layers['eyeShadow']
	%Eyeliner.self_modulate = selected_data.color_layers['eyeLid']
	%EyeWhite.self_modulate = selected_data.color_layers['eyeWhite']
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']
	%Pupil2.self_modulate = selected_data.color_layers['hilight']
