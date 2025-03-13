extends Control
class_name OptionsMenu


func _ready() -> void:
	$Video/FPSLimit/Scrollbox/Scrollbar.value = Global.SETTINGS.fps_limit
	$Video/Brightness/Scrollbox/Scrollbar.value =  Global.SETTINGS.brightness
	
	$Audio/MasterVolume/Scrollbox/ScrollBar.value = Global.SETTINGS.master_volume
	$Audio/MusicVolume/Scrollbox/ScrollBar.value = Global.SETTINGS.music_volume
	$Audio/MenuMusicVolume/Scrollbox/ScrollBar.value = Global.SETTINGS.menu_music_volume
	$Audio/SFXVolume/Scrollbox/ScrollBar.value = Global.SETTINGS.sfx_volume


func _on_video_pressed() -> void:
	$Options.hide()
	$Video.show()


func _on_audio_pressed() -> void:
	$Options.hide()
	$Audio.show()


func _on_controls_pressed() -> void:
	$Options.hide()
	$Controls.show()


func _on_child_back_pressed() -> void:
	$Video.hide()
	$Audio.hide()
	$Controls.hide()
	$Options.show()


func _on_save_pressed() -> void:
	SaveHandler.save_settings_data()


func _on_back_pressed() -> void:
	SignalBus.change_scene.emit("uid://ci3j2f2igok5a", Util.SCENE_CHANGE_TYPES.FB, false)


func _on_fps_limit_value_changed(value: float) -> void:
	$Video/FPSLimit/ValueLabel.text = str(int(value))
	Global.SETTINGS.fps_limit = int(value)


func _on_brightness_value_changed(value: float) -> void:
	$Video/Brightness/ValueLabel.text = str(int(value))
	Global.SETTINGS.brightness = int(value)


func _on_master_volume_value_changed(value: float) -> void:
	$Audio/MasterVolume/ValueLabel.text = str(int(value))
	Global.SETTINGS.master_volume = int(value)


func _on_music_volume_value_changed(value: float) -> void:
	$Audio/MusicVolume/ValueLabel.text = str(int(value))
	Global.SETTINGS.music_volume = int(value)


func _on_menu_music_volume_value_changed(value: float) -> void:
	$Audio/MenuMusicVolume/ValueLabel.text = str(int(value))
	Global.SETTINGS.menu_music_volume = int(value)


func _on_sfx_volume_value_changed(value: float) -> void:
	$Audio/SFXVolume/ValueLabel.text = str(int(value))
	Global.SETTINGS.sfx_volume = int(value)
