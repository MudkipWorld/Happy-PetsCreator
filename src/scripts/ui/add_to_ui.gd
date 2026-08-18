extends Node

var color_box : PackedScene = preload("res://ui/color_box.tscn")
var attributes_check : PackedScene = preload("res://ui/attributes_check.tscn")
var type_option : PackedScene = preload("res://ui/type_options.tscn")

func _ready() -> void:
	GlobalData.add_to_ui = self


func add_ui_pet(type : GlobalData.PetType):
	for i in %ColorsData.get_children():
		i.queue_free()
		
	for i in %AttributesData.get_children():
		i.queue_free()
		
	for i in %TypesData.get_children():
		i.queue_free()
		
	
	var selected_class = null
	match type:
		GlobalData.PetType.Dog:
			selected_class = Attirbute.DogAttirbutes
		GlobalData.PetType.Corgi:
			selected_class = Attirbute.CorgiAttirbutes
		GlobalData.PetType.Yorkie:
			selected_class = Attirbute.YorkieAttirbutes
		GlobalData.PetType.Reindeer:
			selected_class = Attirbute.ReindeerAttirbutes
		GlobalData.PetType.Wolf:
			selected_class = Attirbute.WolfAttirbutes
		GlobalData.PetType.MaineCoon:
			selected_class = Attirbute.MaineCoonAttirbutes
		GlobalData.PetType.Triceratops:
			selected_class = Attirbute.TriceratopsAttirbutes
		_:
			selected_class = Attirbute.DogAttirbutes
	
	for i in selected_class.base.keys():
		var spawn = color_box.instantiate()
		spawn.color_layer = i
		spawn.color = selected_class.base[i]
		%ColorsData.add_child(spawn)
		
	for i in selected_class.colors.keys():
		var spawn = color_box.instantiate()
		spawn.color_layer = i
		spawn.color = selected_class.colors[i]
		%ColorsData.add_child(spawn)

	for i in selected_class.att.keys():
		if i == 'scale' : continue
		var spawn = attributes_check.instantiate()
		spawn.color_layer = i
		%AttributesData.add_child(spawn)

	for i in selected_class.pet_types.keys():
		var spawn = type_option.instantiate()
		spawn.type_layer = i
		spawn.populate_option(selected_class.pet_types)
		%TypesData.add_child(spawn)
