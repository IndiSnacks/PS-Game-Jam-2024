extends Node

@export var num_shadows = 100

var path : Path2D
var pathfollow2D : PathFollow2D
var text : TextEdit

func _ready():
	path = get_parent().get_node("Path2D")
	text = get_node("TextEdit")
	text.text = str(num_shadows)

func _on_button_button_down():
	if(num_shadows > 0):
		spawn_shadow()
		num_shadows -= 1
		set_text()
	else:
		text.text = "no more shadows!"
		

func spawn_shadow():
	pathfollow2D = preload("res://Components/shadow_monster.tscn").instantiate()
	path.add_child(pathfollow2D)

func set_text():
	text.text = str(num_shadows)


