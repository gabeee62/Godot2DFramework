extends Node


func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS


func process_command(text: String) -> void:
	var command_split: Array = split_command(text)
	#var options: Array = command_split[1]
	var args: Array = command_split[2]
	match command_split[0]:
		"help":
			help(args)
		"mode":
			change_game_mode(args)
		"name":
			change_name(args)
		"summon":
			pass
		"say":
			say(args)


func split_command(text: String) -> Array:
	var command_split: PackedStringArray = text.split(" ")
	
	var command: String = command_split[0].to_lower()
	command_split.remove_at(0)
	
	var options: Array[String]
	var args: Array[String]
	for i in command_split:
		if i.begins_with("-"):
			options.append(i.to_lower())
		else:
			args.append(i.to_lower())
	
	print("COMMAND ENTERED:")
	print("COMMAND: " + command)
	print("OPTIONS: ", options)
	print("ARGS: ", args, "\n")
	return [command, options, args]


func help(args: Array[String]):
	var help_dict: Dictionary = JSON.parse_string(FileAccess.get_file_as_string("res://data/commands/commands.json"))
	if args[0] in help_dict:
		var help_message: String = FileAccess.get_file_as_string(help_dict[args[0]]["HELPMESSAGE"])
		print(help_message)
	else:
		print(FileAccess.get_file_as_string("res://manual/help/no_match.txt"))


func change_game_mode(args: Array[String]):
	if args[0] != null:
		match args[0]:
			"c":
				print("GAME MODE SWITCHED TO C\n")
			"s":
				print("GAME MODE SWITCHED TO S\n")
	args.remove_at(0)


func change_name(args: Array[String]):
	Global.SAVE.player_data.name = args[0]
	print("SYSTEM: Player name changed to " + Global.SAVE.player_data.name + "\n")


func say(args: Array[String], player_name: String = Global.PLAYER.data.name	):
	var line: String = ""
	for block in args:
		if block != args[0]:
			line += " " + block
		else:
			line += block
	print(player_name + ": " + line)
