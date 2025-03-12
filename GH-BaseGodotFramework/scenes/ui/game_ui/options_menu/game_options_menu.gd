extends OptionsMenu

signal back_pressed()


func _on_back_pressed():
	back_pressed.emit()
