extends Node

var config = ConfigFile.new()
const SETTINGS_FILE_PATH = "user://settings.ini"

func _ready() -> void:
	if FileAccess.file_exists(SETTINGS_FILE_PATH):
		config.load(SETTINGS_FILE_PATH)
		load_vars()
	else:
		Global.points = 0
		save_vars()


func save_vars():
	config.set_value("vars", "points", Global.points)
	config.save(SETTINGS_FILE_PATH)

func load_vars():
	Global.points = config.get_value("vars", "points")
