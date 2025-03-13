extends Node

#               --- ABOUT ---
# This script acts as a global housing unit for 
# any important singletons you may want to keep
# track of (ex: the root node of the current scene,
# window size, etc.).

var WINDOW_SIZE: Vector2 = Vector2(1920, 1080)
var GAME_SPEED: float = 1.0
var FPS_LIMIT: int = 0

# Keeps track of the level boot time, plus the cumulative window of time that the player has had the game paused.
# Total is subtracted from the current savefile's playtime before the savefile is saved to the disk.
var playtime: int
# Keeps track of the last time the game was paused
var pause_time: int
# Calculation variable used in Engine.gd when unpaused or when the game is saved that keeps track of how long the
# game was paused.
var pause_gap: int

var SAVE: SaveData
var SETTINGS: SettingsData = preload("res://data/saves/settings/settings.tres")

var MAIN: Main
var PLAYER: Player

var save_dir_path: String = "res://saves/"

var special_chars: Array[String] = [" ", "`", "~", ",", ".", "<", ">", "/", "?", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "+", "=", "[", "]", "{", "}", ";", ":", "'", "\"", "\\", "|"]
