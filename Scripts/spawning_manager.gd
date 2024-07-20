extends Node

var path : Path2D
var pathfollow2D : PathFollow2D

func _ready():
	path = get_parent().get_node("Path2D")

func _on_button_button_down():
	spawn_shadow()

func spawn_shadow():
	pathfollow2D = preload("res://Components/shadow_monster.tscn").instantiate()
	path.add_child(pathfollow2D)
