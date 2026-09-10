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
	%Chest.self_modulate = sel_dat.base_layers['body']
	%Shoulder.self_modulate = sel_dat.base_layers['body']
	%HindQuarter.self_modulate = sel_dat.base_layers['body']
	%Neck.self_modulate = sel_dat.base_layers['neck']
	%Legs.self_modulate = sel_dat.base_layers['leg']
	%Ankles.self_modulate = sel_dat.base_layers['leg']
	%Hooves.self_modulate = sel_dat.base_layers['hoof']
	%Head.self_modulate = sel_dat.base_layers['head']
	%Muzzle.self_modulate = sel_dat.base_layers['muzzle']
	%SideMuzzle.self_modulate = sel_dat.base_layers['muzzle']
	%Nose.self_modulate = sel_dat.base_layers['nose']
	%Mouth.self_modulate = sel_dat.base_layers['mouth']
	
	%TailTuft.self_modulate = sel_dat.color_layers['tailHair']
	%Toes.self_modulate = sel_dat.color_layers['hoofDark']
	%Udders.self_modulate = sel_dat.color_layers['udder']
	%Ear.self_modulate = sel_dat.color_layers['earOuter']
	%InnerEar.self_modulate = sel_dat.color_layers['earInner']
	%Horn.self_modulate = sel_dat.color_layers['horn']
	%Hair.self_modulate = sel_dat.color_layers['hair']
	%HeadStripe.self_modulate = sel_dat.color_layers['noseBridge']
	%Chin.self_modulate = sel_dat.color_layers['jaw']
	%NoseShine.self_modulate = sel_dat.color_layers['noseLight']
	
	%EyeCircle.self_modulate = sel_dat.color_layers['eyeSocket']
	%EyeWhite.self_modulate = sel_dat.color_layers['eyeWhite']
	%Iris.self_modulate = sel_dat.color_layers['iris']
	%Pupil.self_modulate = sel_dat.color_layers['pupil']
	%Pupil2.self_modulate = sel_dat.color_layers['eyeHilite']
	%Eyeline.self_modulate = sel_dat.color_layers['eyeShadow']
	%Eyeliner.self_modulate = sel_dat.color_layers['eyeLash']
	checks()

func checks():
	var sel_dat = get_held_item()
	if sel_dat == null : return
	%SpotsBody.self_modulate = sel_dat.color_layers['spots'] if sel_dat.attributes['spots'] else Color.TRANSPARENT
	%SpotsLegs.self_modulate = sel_dat.color_layers['spots'] if sel_dat.attributes['spots'] else Color.TRANSPARENT
	%StarBody.self_modulate = sel_dat.color_layers['star'] if sel_dat.attributes['star'] else Color.TRANSPARENT
	%StarLegs.self_modulate = sel_dat.color_layers['star'] if sel_dat.attributes['star'] else Color.TRANSPARENT
	
	var is_star : bool = sel_dat.types.get('headSpotType', []) == ['star']
	%StarFace.self_modulate = sel_dat.color_layers['headSpot'] if sel_dat.attributes['headSpot'] and is_star else Color.TRANSPARENT
	%SplotchFace.self_modulate = sel_dat.color_layers['headSpot'] if sel_dat.attributes['headSpot'] and !is_star else Color.TRANSPARENT

func get_held_item() -> Attirbute:
	if GlobalData.held_items.size() < 1: return null
	var item : Dictionary = GlobalData.held_items[0]
	if item.is_empty() : return null
	var sel_dat : Attirbute = item.get('data')
	
	if sel_dat == null or !is_instance_valid(sel_dat): return null
	if sel_dat is not Attirbute.CowAttirbutes: return null
	
	return sel_dat
