extends Node

var game_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	game_scene = preload("res://Scenes/sahil_scene.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	var instance = game_scene.instantiate()
	get_tree().get_root().add_child(instance) 
	get_tree().set_current_scene(instance)  
	queue_free() 
	
