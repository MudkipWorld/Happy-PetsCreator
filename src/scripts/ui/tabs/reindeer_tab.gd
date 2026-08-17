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
	if selected_data is not Attirbute.ReindeerAttirbutes: return
	%Body.self_modulate = selected_data.base_layers['body']
	%Head.self_modulate = selected_data.base_layers['face']
	%Nose.self_modulate = selected_data.base_layers['nose']
	%Mouth.self_modulate = selected_data.base_layers['mouth']

	%Legs.self_modulate = selected_data.color_layers['leg']
	%Legs3.self_modulate = selected_data.color_layers['shoulder']
	
	%Ear.self_modulate = selected_data.color_layers['earOuter']
	%InnerEar.self_modulate = selected_data.color_layers['earInner']
	%Eyebrows.self_modulate = selected_data.color_layers['eyeBrow']
	
	%EyeWhite.self_modulate = selected_data.color_layers['eyeWhite']
	%Eyeline.self_modulate = selected_data.color_layers['eyeShadow']
	%Eyelid.self_modulate = selected_data.color_layers['eyeLid']
	
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']
	
	%Neck.self_modulate = selected_data.color_layers['neck']
	%Muzzle.self_modulate = selected_data.color_layers['muzzle']
	
	%Body2.self_modulate = selected_data.color_layers['appoloosaTail']
	%Chest.self_modulate = selected_data.color_layers['tummy']
	

	%Paws.self_modulate = selected_data.color_layers['hoof']
	%Paws2.self_modulate = selected_data.color_layers['hoofHilite']
	
	%Legs2.self_modulate = selected_data.color_layers['legStripe']
	%Face.self_modulate = selected_data.color_layers['faceStripe']
	
	%Antlers.self_modulate = selected_data.color_layers['antler1']
