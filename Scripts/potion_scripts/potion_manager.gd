extends Node2D

# Load the Potion PackedScene (ensure the path is correct)
@export var PotionScene : PackedScene

# Dictionary to hold active potion instances
var potions = {}

# Create a new potion and add it to the scene
func create_potion(name: String, position: Vector2) -> void:
	if PotionScene == null:
		print("PotionScene is not assigned.")
		return
	
	# Create a new potion instance from the PackedScene
	var potion_instance = PotionScene.instantiate() as Sprite2D
	if potion_instance:
		var potion = Potion.new()
		potion.name = name
		
		var potion_sprite = potion.create_sprite()
		potion_sprite.position = position
		potion_instance.texture = potion_sprite.texture

		# Add the potion sprite to the scene
		add_child(potion_instance)
		
		# Add potion to the dictionary with a unique ID
		var potion_id = str(hash(potion_sprite.position))
		potions[potion_id] = potion_instance

# Remove a potion from the scene by its ID
func remove_potion(potion_id: String) -> void:
	if potions.has(potion_id):
		var potion_instance = potions[potion_id]
		# Remove the potion from the scene
		if potion_instance:
			potion_instance.queue_free()
		# Remove from the dictionary
		potions.erase(potion_id)

# Example of updating potion properties
func update_potion(potion_id: String, new_name: String) -> void:
	if potions.has(potion_id):
		var potion_instance = potions[potion_id]
		if potion_instance:
			var potion = Potion.new()
			potion.name = new_name
			var potion_sprite = potion.create_sprite()
			potion_instance.texture = potion_sprite.texture

func _ready():
	# Example usage:
	# Create potions
	create_potion("red", Vector2(100, 100))
	create_potion("yellow", Vector2(300, 100))
	
	# Later, you can remove or update potions as needed
	# remove_potion("some_unique_id")
	# update_potion("some_unique_id", "blue")
