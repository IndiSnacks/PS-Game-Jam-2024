extends Node2D

var healthbar : ProgressBar

@export var max_health = 10

var health = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar = get_child(1)
	health = max_health
	
	healthbar.max_value = max_health * 100
	healthbar.value = max_health * 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage):
	if(health > 0):
		health -= damage
		healthbar.value -= damage * 100
	else:
		get_parent().queue_free()
	#print(health)
