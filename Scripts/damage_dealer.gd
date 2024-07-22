extends Area2D

@export var damage_speed = 0.5
@export var damage_amount = 0.0
@export var charge_increment = 0.1
@export var is_aoe = false
@export var is_charge = false

var shadow_queue = []
var timer = 0.0
var charge = 0.0

func _ready():
	pass 

func _process(delta):
	timer += delta
	if is_charge and charge < 100:
		charge += charge_increment
	if(timer >= damage_speed): 
		timer = 0.0
		if(!is_aoe): #damges the first target if not aoe
			if not is_charge:
				if(shadow_queue.size() > 0):
					var target = shadow_queue[0]
					target.take_damage(damage_amount)
			else:
				if(shadow_queue.size() > 0) and charge >= 100:
					var target = shadow_queue[0]
					target.take_damage(damage_amount)
					charge = 0
		if(is_aoe): #damages all in raduis if aoe
			if not is_charge:
				for shadow in shadow_queue:
					shadow.take_damage(damage_amount)
			else:
				if charge >= 100:
					for shadow in shadow_queue:
						shadow.take_damage(damage_amount)
					charge = 0

# Put all the nodes the area into a queue
# Do tick damage to the top node
# Send a signal to the top node form int of damage
# Pop the node if it leaves the area
func _on_area_entered(area):
	if(area.is_in_group("shadow")):
		print('ADDED SHADOW')
		shadow_queue.append(area)

func _on_area_exited(area):
	if(area.is_in_group("shadow")):
		print('BYE SHADOW')
		shadow_queue.erase(area)
