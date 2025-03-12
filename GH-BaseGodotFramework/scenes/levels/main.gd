extends Node2D
class_name Main

var player_scene: PackedScene = preload("res://scenes/player/player.tscn")

var level_data: LevelData

@export var data_path: String

@export var transition_type: Util.SCENE_CHANGE_TYPES


func _ready() -> void:
	Global.MAIN = self
	Global.playtime = Time.get_ticks_msec()
	
	level_data = ResourceLoader.load(Global.save_dir_path + Global.SAVE.filename + "/level_data/" + data_path)
	Global.SAVE.current_level_path = "res://scenes/levels/" + level_data.filename + "/" + level_data.filename + ".tscn"
	
	var player: Player = Player.new(Global.SAVE.player_data)
	add_child(player)
	
	startup()
	
	SignalBus.main_started.emit()


# ADDITIONAL READY COMMANDS SPECIFIC TO INHERITED SCENES
func startup():
	pass


func boot_message() -> Array[String]:
	return [
	"===== LEVEL BOOT MESSAGE =====",
	"LEVEL: " + level_data.level_name,
	"DESC: " + level_data.level_desc,
	"CHEATS: " + Util.yes_no(level_data.cheats),
	"===== LEVEL BOOT MESSAGE =====\n"
	]
