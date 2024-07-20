extends Node

@export var speed = 10.0

var parent
var path

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	path = parent.get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if path.progress_ratio < 1.0:
		move_on_path(delta)
	else:
		path.progress_ratio = 1.0

func move_on_path(delta):
	path.progress_ratio += 0.01 * speed * delta