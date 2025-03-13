extends Control

var title_or_desktop: bool


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("PAUSE"):
		if visible:
			hide()
			$SaveAndConfirm.hide()
			SignalBus.pause_game.emit()
		elif not get_tree().paused and SceneChanger.get_child(1).current_animation == "":
			show()
			SignalBus.pause_game.emit()


func _on_back_pressed() -> void:
	SignalBus.pause_game.emit()
	visible = not visible
	$SaveAndConfirm.hide()


func _on_options_pressed() -> void:
	$GameOptionsMenu.show()
	$PauseMenu.hide()


func _on_game_options_menu_back_pressed() -> void:
	$GameOptionsMenu.hide()
	$PauseMenu.show()


func _on_save_pressed() -> void:
	SaveHandler.save_to_disk()


func _on_menu_quit_pressed() -> void:
	title_or_desktop = true
	$PauseMenu.hide()
	$SaveAndConfirm.show()


func _on_desktop_quit_pressed() -> void:
	title_or_desktop = false
	$PauseMenu.hide()
	$SaveAndConfirm.show()


func _on_yes_button_pressed() -> void:
	$SaveAndConfirm.hide()
	SignalBus.quit_game.emit(title_or_desktop, true)


func _on_no_button_pressed() -> void:
	$SaveAndConfirm.hide()
	SignalBus.quit_game.emit(title_or_desktop, false)


func _on_quit_back_pressed() -> void:
	$SaveAndConfirm.hide()
	$PauseMenu.show()
