extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	#print(area.get_groups())
	if(area.is_in_group("blue_pot")):
		print("Blue")
	if(area.is_in_group("purple_pot")):
		print("purple")
