extends Node

##TODO Erase these comments when you're done setting up the audio manager
##Game Manager:
##This node is not necessarily meant to be an autoload, but rather sit at the top of the node hierarchy
##Nodes get switched out as children of this node and this is where game-wide data is stored
##By default, you'd put the node configuration of what is meant to run on launch and have things loop back to main menu

#Where all menu UIs are rendered
#Set to run while paused
@onready var menu_ui = $MenuUI
#Activates or deactivates the debug mode
@export var debug_mode: bool = false




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
