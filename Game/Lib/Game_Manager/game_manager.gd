extends Node

class_name Game_Manager

##TODO Erase these comments when you're done setting up the audio manager
##Game Manager:
##This node is not necessarily meant to be an autoload, but rather sit at the top of the node hierarchy
##Nodes get switched out as children of this node and this is where game-wide data is stored
##By default, you'd put the node configuration of what is meant to run on launch and have things loop back to main menu

#Activates or deactivates the debug mode
@export var debug_mode: bool = false

#Where all menu UIs are rendered
#Set to run always
@onready var menu_ui: CanvasLayer = $MenuUI

@onready var main_menu = preload("res://Game/UI/Main_Menu/main_menu.tscn")
@onready var settings_menu = preload("res://Game/UI/Settings_Menu/settings.tscn")
@onready var credits_menu = preload("res://Game/UI/Credits_Menu/credits_menu.tscn")
@onready var game

@export var current_menu: Control

#Dictionary that holds all the relevant menus we will be switching through
@onready var Menu_Scenes: Dictionary = {
	"Main": main_menu,
	"Start": 'PUT THE GAME OR LEVEL MANAGER IN HERE',
	"Settings": settings_menu,
	"Credits": credits_menu,
	"Pause": 'PAUSE SCREEN HERE',
	"Quit": 'later dude'
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.game_state_changed.connect(change_scene.bind())

func change_scene(new_state: String):
	if debug_mode == true:
		prints('scene changed', new_state, Menu_Scenes[new_state])
	if new_state == "Quit":
		get_tree().quit()
	if Menu_Scenes[new_state] is PackedScene:
		var new_scene = Menu_Scenes[new_state].instantiate()
		menu_ui.add_child(new_scene)
		
	
