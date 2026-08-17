extends Control
class_name DataCreator

enum ActionType {
	Save,
	Load,
	Reference,
	LoadData,
	SaveSeparate
}


var current_action : ActionType
static var current_pet : GlobalData.PetType = GlobalData.PetType.Cat

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().title = "HP-PetCreator v" + str(ProjectSettings.get_setting_with_override("application/config/version"))
	%Files.get_popup().id_pressed.connect(file_menu_selected)

func file_menu_selected(id : int):
	match id :
		0:
			current_action = ActionType.Load
			%FileDialog.filters = ['*.json']
			%FileDialog.file_mode = FileDialog.FileMode.FILE_MODE_OPEN_FILE
			%FileDialog.popup()
		1:
			current_action = ActionType.Save
			%FileDialog.filters = ['*.json']
			%FileDialog.file_mode = FileDialog.FileMode.FILE_MODE_SAVE_FILE
			%FileDialog.popup()
		2:
			current_action = ActionType.Reference
			%FileDialog.filters = ['*.png, *.jpg, *.svg, *.jpeg']
			%FileDialog.file_mode = FileDialog.FileMode.FILE_MODE_OPEN_FILE
			%FileDialog.popup()
		3:
			current_action = ActionType.LoadData
			%FileDialog.filters = ['*.json']
			%FileDialog.file_mode = FileDialog.FileMode.FILE_MODE_OPEN_FILES
			%FileDialog.popup()
		4:
			GlobalData.reset_data()
			if is_instance_valid(GlobalData.left_ui_2):
				GlobalData.left_ui_2.check_type()
		5:
			current_action = ActionType.SaveSeparate
			%FileDialog.filters = ['*.json']
			%FileDialog.file_mode = FileDialog.FileMode.FILE_MODE_SAVE_FILE
			%FileDialog.popup()

func _on_file_dialog_file_selected(path: String) -> void:
	match current_action:
		ActionType.Load:
			SaveAndLoad.load_file(path)
		ActionType.Save:
			SaveAndLoad.save_file(path)
		ActionType.Reference:
			SaveAndLoad.load_reference(path)
		ActionType.SaveSeparate:
			SaveAndLoad.save_file_separate(path)

func _on_file_dialog_files_selected(paths: PackedStringArray) -> void:
	match current_action:
		ActionType.LoadData:
			SaveAndLoad.load_data(paths)
