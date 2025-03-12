extends Control


func _ready() -> void:
	$VBoxContainer/SaveName.grab_focus()


func _on_confirm_pressed() -> void:
	var save_name: String = $VBoxContainer/SaveName.text
	var player_name: String = $VBoxContainer/PlayerName.text
	if save_name and save_name != "":
		if player_name and player_name != "":
			for schar in Global.special_chars:
				if save_name.contains(schar):
					# ERRCODE: CS1 -- INVALID CHARACTER DETECTED
					SignalBus.game_error.emit(Util.ERR_CODES.CS1)
					return
			for dir in DirAccess.get_directories_at("res://saves/"):
				if save_name == dir:
					# ERRCODE: CS2 -- MATCHING SAVE NAME DETECTED
					SignalBus.game_error.emit(Util.ERR_CODES.CS2)
					return
				else:
					SaveHandler.create_new_save(save_name, player_name)
					return
		else:
			# ERRCODE: CS4 -- EMPTY PLAYER NAME DETECTED
			SignalBus.game_error.emit(Util.ERR_CODES.CS4)
	else:
		# ERRCODE: CS3 -- EMPTY SAVE NAME DETECTED
		SignalBus.game_error.emit(Util.ERR_CODES.CS3)


func _on_back_pressed() -> void:
	SignalBus.change_scene.emit("uid://ci3j2f2igok5a", Util.SCENE_CHANGE_TYPES.FB, false)
