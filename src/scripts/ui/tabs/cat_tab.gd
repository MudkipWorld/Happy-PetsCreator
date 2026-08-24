extends Control


func _ready() -> void:
	Globalsignals.recolor_part.connect(recolor_part)
	Globalsignals.check_part.connect(checks)
	Globalsignals.check_part_special.connect(checks)

func recolor_part():
	var sel_dat = get_held_item()
	if sel_dat == null : return
	%Tail.self_modulate = sel_dat.base_layers['tail']
	%Body.self_modulate = sel_dat.base_layers['body']
	%Legs.self_modulate = sel_dat.base_layers['leg']
	%Paws.self_modulate = sel_dat.base_layers['foot']
	%Ruff.self_modulate = sel_dat.base_layers['ruff']
	%Head.self_modulate = sel_dat.base_layers['head']
	%Nose.self_modulate = sel_dat.base_layers['nose']
	%Mouth.self_modulate = sel_dat.base_layers['mouth']
	
	%Paws2.self_modulate = sel_dat.base_layers['toes']
	
	%Ear.self_modulate = sel_dat.color_layers['earOuter']
	%InnerEar.self_modulate = sel_dat.color_layers['earInner']
	%Eyebrows.self_modulate = sel_dat.color_layers['eyeBrow']
	
	%Eyeline.self_modulate = sel_dat.color_layers['eyeShadow']
	%Iris.self_modulate = sel_dat.color_layers['iris']
	%Pupil.self_modulate = sel_dat.color_layers['pupil']
	checks()
	check_special()

func check_special():
	var sel_dat = get_held_item()
	if sel_dat == null : return
	%Face.self_modulate = sel_dat.color_layers['face'] if sel_dat.types['body'] == ['skinny'] else Color.TRANSPARENT

func checks():
	var sel_dat = get_held_item()
	if sel_dat == null : return
	%Pattern1.self_modulate = sel_dat.color_layers['calicoSpots1'] if sel_dat.attributes['calicoSpots1'] else Color.TRANSPARENT
	%Pattern2.self_modulate = sel_dat.color_layers['calicoSpots2'] if sel_dat.attributes['calicoSpots2'] else Color.TRANSPARENT
	%Pattern3.self_modulate = sel_dat.color_layers['leopardSpots'] if sel_dat.attributes['leopardSpots'] else Color.TRANSPARENT
	%Pattern4.self_modulate = sel_dat.color_layers['leopardSpots'] if sel_dat.attributes['leopardSpots'] else Color.TRANSPARENT
	%Pattern5.self_modulate = sel_dat.color_layers['stripes'] if sel_dat.attributes['stripes'] else Color.TRANSPARENT
	%Star.self_modulate = sel_dat.color_layers['tattooStar'] if sel_dat.attributes['tattooStar'] else Color.TRANSPARENT

func get_held_item() -> Attirbute:
	if GlobalData.held_items.size() < 1: return null
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return null
	var sel_dat : Attirbute = item.get('data')
	
	if sel_dat == null or !is_instance_valid(sel_dat): return null
	if sel_dat is not Attirbute.CatAttirbutes: return null
	
	return sel_dat
