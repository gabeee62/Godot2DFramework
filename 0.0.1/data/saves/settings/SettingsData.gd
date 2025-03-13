extends Resource
class_name SettingsData

@export_group("Video Settings")
@export var fps_limit: int = 0
@export var brightness: int = 50
@export_group("", "")

@export_group("Audio Settings")
@export var master_volume: int = 100
@export var music_volume: int = 100
@export var menu_music_volume: int = 100
@export var sfx_volume: int = 100
@export_group("", "")

@export_group("Control Settings")
@export var walk_left: InputEventKey
@export var walk_right: InputEventKey
@export var run: InputEventKey
@export var jump: InputEventKey
@export var pause: InputEventKey
@export var cheats: InputEventKey
@export_group("", "")
