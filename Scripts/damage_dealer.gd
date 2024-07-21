extends Area2D

@export var damage_speed = 0.5
@export var damage_amount = 1
@export var is_aoe = false

var shadow_queue = []
var timer = 0.0

func _ready():
	pass 

func _process(delta):
	timer += delta
	if(timer >= damage_speed): 
		timer = 0.0
		if(!is_aoe): #damges the first target if not aoe
			if(shadow_queue.size() > 0):
				var target = shadow_queue[0]
				target.take_damage(damage_amount)
		if(is_aoe): #damages all in raduis if aoe
			for shadow in shadow_queue:
				shadow.take_damage(damage_amount)

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
