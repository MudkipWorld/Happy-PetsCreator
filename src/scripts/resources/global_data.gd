extends RefCounted
class_name GlobalData

enum PetType {
	Cat,
	Dog,
	Corgi,
	Yorkie,
	Reindeer,
	Wolf,
	MaineCoon,
	Triceratops,
	Fox,
	Horse,
	GuineaPig,
	Kangaroo,
	Pig,
	Platypus,
	Koala,
	Llama,
	Turkey
}

static var pet_map : Dictionary[GlobalData.PetType, Dictionary] = {
	PetType.Cat : {'attribute' : Attirbute.CatAttirbutes, 'pets_data' : [], 'name' : 'cats'},
	PetType.Dog : {'attribute' : Attirbute.DogAttirbutes, 'pets_data' : [], 'name' : 'dogs'},
	PetType.Corgi : {'attribute' : Attirbute.CorgiAttirbutes, 'pets_data' : [], 'name' : 'corgi'},
	PetType.Yorkie : {'attribute' : Attirbute.YorkieAttirbutes, 'pets_data' : [], 'name' : 'yorkie'},
	
	PetType.Reindeer : {'attribute' : Attirbute.ReindeerAttirbutes, 'pets_data' : [], 'name' : 'reindeer'},
	PetType.Wolf : {'attribute' : Attirbute.WolfAttirbutes, 'pets_data' : [], 'name' : 'wolf'},
	PetType.MaineCoon : {'attribute' : Attirbute.MaineCoonAttirbutes, 'pets_data' : [], 'name' : 'maine_coon'},
	PetType.Triceratops : {'attribute' : Attirbute.TriceratopsAttirbutes, 'pets_data' : [], 'name' : 'triceratops'},
	
	PetType.Fox : {'attribute' : Attirbute.FoxAttirbutes, 'pets_data' : [], 'name' : 'fox'},
	PetType.Horse : {'attribute' : Attirbute.HorseAttirbutes, 'pets_data' : [], 'name' : 'horse'},
	PetType.GuineaPig : {'attribute' : Attirbute.GuineaPigAttirbutes, 'pets_data' : [], 'name' : 'guinea_pig'},
	PetType.Kangaroo : {'attribute' : Attirbute.KangarooAttirbutes, 'pets_data' : [], 'name' : 'kangaroo'},
	
	PetType.Pig : {'attribute' : Attirbute.PigAttirbutes, 'pets_data' : [], 'name' : 'pig'},
	PetType.Platypus : {'attribute' : Attirbute.PlatypusAttirbutes, 'pets_data' : [], 'name' : 'platypus'},
	PetType.Koala : {'attribute' : Attirbute.KoalaAttirbutes, 'pets_data' : [], 'name' : 'koala'},
	PetType.Llama : {'attribute' : Attirbute.LlamaAttirbutes, 'pets_data' : [], 'name' : 'llama'},
	PetType.Turkey : {'attribute' : Attirbute.TurkeyAttirbutes, 'pets_data' : [], 'name' : 'turkey'},
	
}

static var add_to_ui : Node
static var left_ui_2 : Control

static var held_items : Array = []
static var held_data : Array = []

static func create_data(current_pet : PetType):
	var pet : Dictionary = {
		'data' : null,
		'cost' : 100,
		'ap_cost' : 0,
		'age_per_level' : 7200,
		'max_hunger' : 14400,
		'min_level' : 1,
		'ticket_cost' : 0,
		'flags' : 0,
		'name' : 'Placeholder'
		}

	var selected_pet : Dictionary = pet_map.get(current_pet, {})
	if selected_pet.is_empty() : return
	
	var att : Attirbute = selected_pet['attribute'].new()
	pet['data'] = att
	selected_pet['pets_data'].append(pet)

static func remove_data(current_pet : PetType, data : Dictionary):
	var selected_pet : Dictionary = pet_map.get(current_pet, {})
	if selected_pet.is_empty() : return
	selected_pet['pets_data'].erase(data)

static func reset_data():
	for i in pet_map.values():
		var selected_pet : Dictionary = i
		selected_pet['pets_data'].clear()

static func set_held_data(current_pet : PetType):
	var selected_pet : Dictionary = pet_map.get(current_pet, {})
	if selected_pet.is_empty() : return
	held_data = selected_pet.get('pets_data', [])
