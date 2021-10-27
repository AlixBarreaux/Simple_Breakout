class_name LevelSelectionButton
extends Button


# ----------------------------- DECLARE VARIABLES ------------------------------


#export var level_to_load: PackedScene = null
export var level_name: String = ""
export var preview_image_stream_texture: StreamTexture = null


var game_scene_path: String = "res://Scenes/Game.tscn"
export var level_to_load_path: String = ""


onready var name_label: Label = $VBoxContainer/NameLabel
onready var preview_image: TextureRect = $VBoxContainer/PreviewImage


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
#	# The Level Name must be provided in the inspector!
	assert(self.level_name != "")
#	# A preview Image must be provided in the inspector!
	assert(self.preview_image_stream_texture != null)
	
	
	# The Button's text will be set by the script.
	# Please clear it in the insepctor.
	assert(self.text == "")
	assert(game_scene_path != "")
	assert(self.level_to_load_path != "")
	




func _initialize() -> void:
	self.name_label.text = self.level_name
	self.preview_image.texture = self.preview_image_stream_texture





func _on_LevelSelectionButton_pressed() -> void:
	var error_code: int = 0
#	error_code = self.get_tree().change_scene_to(self.level_to_load)
	
	
	
	
	# TEST
	# DISABLE LIVES
	Global.set_enable_lives(false)
	
	error_code = self.get_tree().change_scene(self.game_scene_path)
	Global.set_level_to_load_path(self.level_to_load_path)
	Global.set_load_next_level(true)
	# END TEST
	
	
	
	
#	if error_code == OK:
#		print("Scene successfully loaded: " + str(self.level_to_load))
	if error_code == ERR_CANT_CREATE:
		printerr("(!) ERROR: In level_selection_button.gd")
#		printerr("Couldn't load the PackedScene!")
#	else:
#		printerr("(!) ERROR: In level_selection_button.gd")
#		printerr("(!) Unkown error!")
		

#func load_level(scene_path: String) -> void:
#	self.get_tree().change_scene("res://Scenes/Main.tscn")
