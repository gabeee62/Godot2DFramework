extends Node

#             --- ABOUT ---
# This script provides global access to game
# enumerators and utility functions. Useful
# for tracking game states, item types, etc.

enum GAME_STATES {RUNNING, PAUSED}
enum GAME_TYPES {PLATFORMER, TOPDOWN}

enum ERR_CODES {TS1, CS1, CS2, CS3, CS4}

enum SCENE_CHANGE_TYPES {FW, FB}

enum EVENT_TYPES {AREA, ACTION}

enum DIFFICULTY_TYPES {EASY, NORMAL, HARD, HARDCORE}


func yes_no(torf: bool) -> String:
	if torf:
		return "YES"
	else:
		return "NO"


func power_of(value: float, exponent: int) -> float:
	for i in range(exponent - 1):
		value *= value
	return value


func msec_to_time(msecs: int) -> String:
	var hrs: int = msecs / 3600000
	msecs -= 360000 * hrs
	var mins: int = msecs / 60000
	msecs -= 60000 * mins
	var secs: int = msecs / 1000
	return "  " + time_format(str(hrs), str(mins), str(secs))


func time_format(hrs: String, mins: String, secs: String) -> String:
	if hrs.length() < 2:
		hrs = hrs.insert(0, "0")
	if mins.length() < 2:
		mins = mins.insert(0, "0")
	if secs.length() < 2:
		secs = secs.insert(0, "0")
	return hrs + ":" + mins + ":" + secs
