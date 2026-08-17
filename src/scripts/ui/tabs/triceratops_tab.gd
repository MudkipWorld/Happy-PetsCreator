extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globalsignals.recolor_part.connect(recolor_part)

func recolor_part():
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return
	var selected_data : Attirbute = item.get('data')
	
	if selected_data == null or !is_instance_valid(selected_data): return
	if selected_data is not Attirbute.TriceratopsAttirbutes: return
	%Tail.self_modulate = selected_data.base_layers['tail']
	%Body.self_modulate = selected_data.base_layers['body']
	%Legs.self_modulate = selected_data.base_layers['leg']
	%Paws.self_modulate = selected_data.base_layers['foot']
	%Head.self_modulate = selected_data.base_layers['head']
	%Mouth.self_modulate = selected_data.base_layers['mouth']
	
	%Paws2.self_modulate = selected_data.color_layers['toeNail']
	%Eyelid.self_modulate = selected_data.color_layers['eyeLid']
	%Eyeline.self_modulate = selected_data.color_layers['eyeShad']
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']

	%Horn.self_modulate = selected_data.color_layers['horn']
	%Horn3.self_modulate = selected_data.color_layers['hornBase']
	%Horn2.self_modulate = selected_data.color_layers['hornShadow']
	
	%Eyeline.self_modulate = selected_data.color_layers['eyeShad']
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']

	%Shield.self_modulate = selected_data.color_layers['shield']
	%Shield2.self_modulate = selected_data.color_layers['shieldHilite']

	%HeadHilite.self_modulate = selected_data.color_layers['headHilite']
	%Shield2.self_modulate = selected_data.color_layers['shieldHilite']

	%Paws3.self_modulate = selected_data.color_layers['footSole']
	%Paws2.self_modulate = selected_data.color_layers['footPad']
	
	%Tail2.self_modulate = selected_data.color_layers['tailStripe']
	%Body3.self_modulate = selected_data.color_layers['torsoStripe']

	%Body2.self_modulate = selected_data.color_layers['torsoSpots']
	%Legs2.self_modulate = selected_data.color_layers['legSpots']
	
	%HeadSpots.self_modulate = selected_data.color_layers['headSpots']
