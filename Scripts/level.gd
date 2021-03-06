class_name Level
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------


# Exports
# Level to load when the level is finished
# (If launched from NewGame into the MainMenu)
export var next_level_to_load_path: String = ""
onready var next_level_to_load = load(next_level_to_load_path)


# Menu to load when the level is finished
# (If launched from LevelSelectionMenu)
var menu_to_load_at_end_path: String = "res://Scenes/GUI/MainMenu.tscn"



# Node References
onready var level_transition_timer: Timer = $LevelTransitionTimer

# Other Variables
onready var load_next_level: bool = Global.get_load_next_level()


# Signals to connect to
onready var signals_connections_list: PoolIntArray = [
	Events.connect("level_finished", self, "on_level_finished")
	]


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()
	self._initialize_signals()
	
	self.show()
	Events.emit_signal("level_started")


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	assert(self.next_level_to_load_path != "")


func _initialize_signals() -> void:
	GeneralHelpers.check_for_signals_initialization_errors(self, self.signals_connections_list)


func on_level_finished() -> void:
	level_transition_timer.start()


func _on_LevelTransitionTimer_timeout() -> void:
	var _error_code: int = 0
	# Check wether the next level or the menu to load will be loaded
	if not self.load_next_level:
		Global.replace_scene(self, self.next_level_to_load, self.get_parent(), self.get_index())
	else:
		_error_code = get_tree().change_scene(menu_to_load_at_end_path)
		GeneralHelpers.check_for_generic_error_code(self, _error_code)
