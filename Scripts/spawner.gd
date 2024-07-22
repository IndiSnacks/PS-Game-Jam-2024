extends Node

# List of prefabs to spawn
@export var prefab_scenes: Array[PackedScene]

# Time interval in seconds between spawns
@export var spawn_interval: float = 2.5  # Adjust this value as needed

# Area within which to spawn prefabs
@export var spawn_area_min: Vector2 = Vector2(-1000, -1000)
@export var spawn_area_max: Vector2 = Vector2(1000, 1000)

func _ready():
	randomize()
	# Start the timer
	var timer = Timer.new()
	timer.set_wait_time(spawn_interval)
	timer.set_one_shot(false)
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	spawn_prefab()

func spawn_prefab():
	if prefab_scenes.size() == 0:
		return

	# Select a random prefab from the list
	var random_index = randi() % prefab_scenes.size()
	var selected_prefab = prefab_scenes[random_index]

	var instance = selected_prefab.instantiate()
	add_child(instance)
	var position = Vector2(
		randf_range(spawn_area_min.x, spawn_area_max.x),
		randf_range(spawn_area_min.y, spawn_area_max.y)
	)
	instance.position = position
