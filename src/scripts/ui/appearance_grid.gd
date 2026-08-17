extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globalsignals.pet_type_selected.connect(show_pet_reference)

func show_pet_reference(type : GlobalData.PetType):
	match type:
		GlobalData.PetType.Cat:
			%PetsReferences.current_tab = 0
		GlobalData.PetType.Dog:
			%PetsReferences.current_tab = 1
		GlobalData.PetType.Corgi:
			%PetsReferences.current_tab = 2
		GlobalData.PetType.Wolf:
			%PetsReferences.current_tab = 3
		GlobalData.PetType.MaineCoon:
			%PetsReferences.current_tab = 4
		GlobalData.PetType.Yorkie:
			%PetsReferences.current_tab = 5
		GlobalData.PetType.Reindeer:
			%PetsReferences.current_tab = 6
		GlobalData.PetType.Triceratops:
			%PetsReferences.current_tab = 7
		_:
			%PetsReferences.current_tab = 8
