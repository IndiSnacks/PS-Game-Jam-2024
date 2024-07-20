extends Node2D

# Load the Potion Resource (make sure this path matches your project)
@export var Potion : Resource
# Dictionary to hold active potion instances
var potions = {}

# Create a new potion and add it to the scene
func create_potion(name: String, position: Vector2) -> void:
	var potion = Potion.new()
	potion.name = name
	var potion_sprite = potion.create_sprite()
	potion_sprite.position = position
	
	# Add the potion sprite to the scene
	add_child(potion_sprite)
	
	# Add potion to the dictionary with a unique ID
	var potion_id = str(hash(potion_sprite.position))
	potions[potion_id] = potion_sprite

# Remove a potion from the scene by its ID
func remove_potion(potion_id: String) -> void:
	if potions.has(potion_id):
		var potion_sprite = potions[potion_id]
		# Remove the sprite from the scene
		if potion_sprite:
			potion_sprite.queue_free()
		# Remove from the dictionary
		potions.erase(potion_id)

# Example of updating potion properties
func update_potion(potion_id: String, new_name: String) -> void:
	if potions.has(potion_id):
		var potion_sprite = potions[potion_id]
		if potion_sprite:
			var potion = Potion.new()
			potion.name = new_name
			potion_sprite.texture = potion.create_sprite().texture

func _ready():
	# Example usage:
	# Create potions
	create_potion("red", Vector2(100, 100))
	create_potion("yellow", Vector2(300, 100))
	
	# Later, you can remove or update potions as needed
	# remove_potion("some_unique_id")
	# update_potion("some_unique_id", "blue")
