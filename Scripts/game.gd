class_name Game
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var level_to_load_instance = load(Global.get_level_to_load_path()).instance()


# ---------------------------------- RUN CODE ----------------------------------

#var lives_manager_path: String = "res://Scenes/Sub_Game_Managers/LivesManager.tscn"
#var lives_manager_instance = load(lives_manager_path).instance()


func _ready() -> void:
	var level_node: Node2D = self.add_child(level_to_load_instance)
	self.move_child(level_to_load_instance, 0)
	
	# Check if the LivesManager should be instanced in the scene tree
#	if Global.get_enable_lives():
#		self.add_child(self.lives_manager_instance)
#		print(self.name, " : Lives are enabled!")
#	else:
#		print(self.name, " : Lives are disabled!")


# ------------------------------ DECLARE FUNCTIONS -----------------------------
