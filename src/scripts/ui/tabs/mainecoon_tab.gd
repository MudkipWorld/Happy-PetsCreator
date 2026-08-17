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
	if selected_data is not Attirbute.MaineCoonAttirbutes: return
	
	%Body.self_modulate = selected_data.base_layers['body']
	
	%Tail.self_modulate = selected_data.color_layers['tail']
	%Legs.self_modulate = selected_data.color_layers['leg']
	%Paws.self_modulate = selected_data.color_layers['foot']
	%Ruff.self_modulate = selected_data.color_layers['chest']
	%Head.self_modulate = selected_data.color_layers['head']
	%Nose.self_modulate = selected_data.color_layers['nose']
	
	%Beard.self_modulate = selected_data.color_layers['beard']
	%Muzzle.self_modulate = selected_data.color_layers['muzzle']
	
	%Mouth.self_modulate = selected_data.color_layers['mouth']
	
	%Paws2.self_modulate = selected_data.color_layers['toe']
	
	%Ear.self_modulate = selected_data.color_layers['ear']
	%InnerEar.self_modulate = selected_data.color_layers['earInner']
	%Ear2.self_modulate = selected_data.color_layers['earDark']
	%Eyebrows.self_modulate = selected_data.color_layers['brow']
	
	%Chin.self_modulate = selected_data.color_layers['chin']
	%Nose2.self_modulate = selected_data.color_layers['noseDark']
	%Whiskers.self_modulate = selected_data.color_layers['whisker']
	
	%Eyeline.self_modulate = selected_data.color_layers['eyeShadow']
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']
