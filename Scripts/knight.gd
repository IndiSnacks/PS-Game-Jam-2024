extends Area2D

var shadow_queue = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(shadow_queue.size() > 0):
		var target = shadow_queue[0]
		target.take_damage(1)

# Put all the nodes the area into a queue
# Do tick damage to the top node
# Send a signal to the top node form int of damage
# Pop the node if it leaves the area
func _on_area_entered(area):
	if(area.is_in_group("shadow")):
		shadow_queue.append(area)

func _on_area_exited(area):
	if(area.is_in_group("shadow")):
		shadow_queue.erase(area)
