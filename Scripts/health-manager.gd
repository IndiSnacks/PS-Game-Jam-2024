extends Node2D

var healthbar : ProgressBar

@export var max_health = 10

var health = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar = get_child(1)
	print(health)
	health = max_health
	
	healthbar.max_value = max_health
	healthbar.value = max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage):
	if(health > 0):
		health -= 1
		healthbar.value -= 1
	else:
		get_parent().queue_free()
	print(health)
