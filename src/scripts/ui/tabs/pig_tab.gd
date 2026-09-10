extends Control


func _ready() -> void:
	Globalsignals.recolor_part.connect(recolor_part)
	Globalsignals.check_part.connect(check_special)
	Globalsignals.check_part_special.connect(check_special)

func recolor_part():
	var sel_dat = get_held_item()
	if sel_dat == null : return
	%Tail.self_modulate = sel_dat.base_layers['tail']
	%Body.self_modulate = sel_dat.base_layers['body']
	%Nose.self_modulate = sel_dat.base_layers['nose']
	%Mouth.self_modulate = sel_dat.base_layers['mouth']
	
	%Legs.self_modulate = sel_dat.base_layers['leg']
	%Legs2.self_modulate = sel_dat.base_layers['leg']
	%Legs3.self_modulate = sel_dat.base_layers['leg']
	
	%Paws.self_modulate = sel_dat.base_layers['foot']
	%Paws2.self_modulate = sel_dat.base_layers['foot']
	%Paws3.self_modulate = sel_dat.base_layers['foot']
	%Paws4.self_modulate = sel_dat.base_layers['foot']
	%Paws5.self_modulate = sel_dat.base_layers['foot']
	
	%Ear.self_modulate = sel_dat.color_layers['earOuter']
	%InnerEar.self_modulate = sel_dat.color_layers['earInner']
	%Eyebrows.self_modulate = sel_dat.color_layers['eyeBrow']
	%Nostrils.self_modulate = sel_dat.color_layers['nostrils']
	
	%Eyeline.self_modulate = sel_dat.color_layers['eyeShadow']
	%Iris.self_modulate = sel_dat.color_layers['iris']
	%Pupil.self_modulate = sel_dat.color_layers['pupil']
	check_special()

func check_special():
	var sel_dat = get_held_item()
	if sel_dat == null : return
	%Spots.self_modulate = sel_dat.color_layers['spots'] if sel_dat.types.get('spots', []) == ['clover'] else Color.TRANSPARENT

func get_held_item() -> Attirbute:
	if GlobalData.held_items.size() < 1: return null
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return null
	var sel_dat : Attirbute = item.get('data')
	
	if sel_dat == null or !is_instance_valid(sel_dat): return null
	if sel_dat is not Attirbute.PigAttirbutes: return null
	
	return sel_dat
