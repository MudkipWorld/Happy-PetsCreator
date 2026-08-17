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
	if selected_data is not Attirbute.YorkieAttirbutes: return
	%Tail.self_modulate = selected_data.base_layers['tail']
	%Body.self_modulate = selected_data.base_layers['body']
	%Legs.self_modulate = selected_data.base_layers['leg']
	%Paws.self_modulate = selected_data.base_layers['foot']
	%Head.self_modulate = selected_data.base_layers['head']
	%Nose.self_modulate = selected_data.base_layers['nose']
	%Mouth.self_modulate = selected_data.base_layers['mouth']
	%Muzzle.self_modulate = selected_data.base_layers['muzzle']
	
	%Paws2.self_modulate = selected_data.base_layers['toes']
	
	%Nose2.self_modulate = selected_data.color_layers['noseSpot']
	
	%Ear.self_modulate = selected_data.color_layers['earOuter']
	%InnerEar.self_modulate = selected_data.color_layers['earInner']
	%Eyebrows.self_modulate = selected_data.color_layers['brow']
	
	%Eyeline.self_modulate = selected_data.color_layers['eyeShad']
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']
	
	%Chest.self_modulate = selected_data.color_layers['chest']
	%Chin.self_modulate = selected_data.color_layers['chin']
	
	%Legs2.self_modulate = selected_data.color_layers['shoulder']
	%Legs3.self_modulate = selected_data.color_layers['thigh']
