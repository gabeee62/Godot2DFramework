extends Control


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("COMMAND_UI"):
		if visible:
			hide()
			SignalBus.pause_game.emit()
		elif not get_tree().paused and SceneChanger.get_child(1).current_animation == "":
			show()
			$LineEdit.grab_focus()
			SignalBus.pause_game.emit()


func _on_line_edit_text_submitted(new_text: String) -> void:
	SignalBus.cheat_entered.emit(new_text)
	$LineEdit.text = ""
