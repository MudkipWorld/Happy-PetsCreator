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
	if selected_data is not Attirbute.DogAttirbutes: return
	%Tail.self_modulate = selected_data.base_layers['tail']
	%Body.self_modulate = selected_data.base_layers['body']
	%Legs.self_modulate = selected_data.base_layers['leg']
	%Paws.self_modulate = selected_data.base_layers['foot']
	%Head.self_modulate = selected_data.base_layers['head']
	%Nose.self_modulate = selected_data.base_layers['nose']
	%Mouth.self_modulate = selected_data.base_layers['mouth']
	
	%Paws2.self_modulate = selected_data.base_layers['toes']
	
	%Ear.self_modulate = selected_data.color_layers['earOuter']
	%InnerEar.self_modulate = selected_data.color_layers['earInner']
	%Eyebrows.self_modulate = selected_data.color_layers['eyeBrow']
	
	%Eyeline.self_modulate = selected_data.color_layers['eyeShadow']
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']
	%Muzzle.self_modulate = selected_data.color_layers['face']
