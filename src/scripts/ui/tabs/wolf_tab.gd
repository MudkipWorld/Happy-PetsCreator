extends Control

func _ready() -> void:
	Globalsignals.recolor_part.connect(recolor_part)

func recolor_part():
	if GlobalData.held_items.size() < 1: return
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return
	var selected_data : Attirbute = item.get('data')
	
	if selected_data == null or !is_instance_valid(selected_data): return
	if selected_data is not Attirbute.WolfAttirbutes: return
	%Tail.self_modulate = selected_data.base_layers['tail']
	%Body.self_modulate = selected_data.base_layers['body']
	%Legs.self_modulate = selected_data.base_layers['leg']
	%Arm.self_modulate = selected_data.base_layers['leg']
	%Paws.self_modulate = selected_data.base_layers['foot']
	%Head.self_modulate = selected_data.base_layers['head']
	%Nose.self_modulate = selected_data.base_layers['nose']
	%Mouth.self_modulate = selected_data.base_layers['mouth']
	
	%Paws2.self_modulate = selected_data.base_layers['toes']
	%Paws3.self_modulate = selected_data.color_layers['claws']
	%Wrist.self_modulate = selected_data.color_layers['wrist']
	
	%Tummy.self_modulate = selected_data.color_layers['undercoat']
	
	%Shoulder.self_modulate = selected_data.color_layers['shoulder']
	%Thigh.self_modulate = selected_data.color_layers['shoulder']
	
	%Neck.self_modulate = selected_data.color_layers['neck']
	%Neck2.self_modulate = selected_data.color_layers['neckUndercoat']
	
	%Cheek.self_modulate = selected_data.color_layers['cheek']
	%Ear2.self_modulate = selected_data.color_layers['earTip']
	%EarFluff.self_modulate = selected_data.color_layers['earFluff']
	%Muzzle.self_modulate = selected_data.color_layers['cheek']
	%Muzzle2.self_modulate = selected_data.color_layers['muzzleTop']
	#%Muzzle3.self_modulate = selected_data.color_layers['muzzleSide']
	%Nose2.self_modulate = selected_data.color_layers['noseTop']
	%EyeBack.self_modulate = selected_data.color_layers['eyeback']
	%Tail2.self_modulate = selected_data.color_layers['tailUndercoat']
	%Tail3.self_modulate = selected_data.color_layers['tailStripe']
	%Tail4.self_modulate = selected_data.color_layers['tailTip']
	
	%Ear.self_modulate = selected_data.color_layers['earOuter']
	%InnerEar.self_modulate = selected_data.color_layers['earInner']
	%Eyebrows.self_modulate = selected_data.color_layers['eyeBrow']
	
	%Eyeline.self_modulate = selected_data.color_layers['eyeShad']
	%Iris.self_modulate = selected_data.color_layers['iris']
	%Pupil.self_modulate = selected_data.color_layers['pupil']
	
	
	%Shoulder2.self_modulate = selected_data.color_layers['shoulderStripe']
	%HeadStripe.self_modulate = selected_data.color_layers['headStripe']
