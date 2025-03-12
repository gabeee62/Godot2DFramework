extends Node

#              --- ABOUT ---
# This script provides global access to any
# important game signals. Useful for tramsmitting 
# signals between nodes that cannot interact
# directly within the tree.

# TITLE SCREEN PLAYER ACTIONS
signal save_chosen(num: int)

# IN-GAME PLAYER ACTIONS
signal pause_game()
signal cheat_entered(cheat_text: String)

# BOTH STATES PLAYER ACTIONS
signal quit_game(title_or_desktop: bool, save_game: bool)

# GAME PROCESS SIGNALS
signal main_started()
signal game_error(err_code: Util.ERR_CODES)
signal change_scene(filepath: String, transition_type: Util.SCENE_CHANGE_TYPES, save: bool)


func _ready() -> void:
	# Throwaway callables to circumvent the warning messages caused by not directly using the signals in the script
	pause_game.get_name()
	game_error.get_name()
	main_started.get_name()
	save_chosen.get_name()
	change_scene.get_name()
	cheat_entered.get_name()
	quit_game.get_name()
