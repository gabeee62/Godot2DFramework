extends PanelContainer
class_name SaveSlot

var save_name: String
var playtime: String
var player_name: String
var display_stat1: String
var display_stat2: String

var save_slot_num: int


func _process(_delta: float) -> void:
	if $MarginContainer/HBoxContainer/SaveName.text != save_name:
		$MarginContainer/HBoxContainer/SaveName.text = save_name
	if $MarginContainer/HBoxContainer/Playtime.text != playtime:
		$MarginContainer/HBoxContainer/Playtime.text = playtime
	if $MarginContainer/HBoxContainer/PlayerName.text != player_name:
		$MarginContainer/HBoxContainer/PlayerName.text = player_name
	if $MarginContainer/HBoxContainer/DisplayStat1.text != display_stat1:
		$MarginContainer/HBoxContainer/DisplayStat1.text = display_stat1
	if $MarginContainer/HBoxContainer/DisplayStat2.text != display_stat2:
		$MarginContainer/HBoxContainer/DisplayStat2.text = display_stat2


func _on_button_pressed() -> void:
	SignalBus.save_chosen.emit(save_slot_num)
