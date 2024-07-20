extends Resource

class_name Potion

# Define the properties of a potion
# Potion names will just be there respective color i.e. red for health
var name: String
var health_boost: int = 0
var stamina_boost: int = 0
var slowing_aura: bool = false
var healing_aura: bool = false
var grass_defense: bool = false
var invisibility: bool = false

# References to potion textures
var textures = {
	"red": preload("res://Art/icon.svg"),
	"yellow": preload("res://Art/icon.svg"),
	"blue": preload("res://Art/icon.svg"),
	"green": preload("res://Art/icon.svg"),
	"orange": preload("res://Art/icon.svg"),
	"purple": preload("res://Art/icon.svg"),
	"default": preload("res://Art/icon.svg")
}

func create_sprite() -> Sprite2D:
	var sprite = Sprite2D.new()
	sprite.texture = textures.get(name, textures["default"])
	return sprite

# Method to apply the potion effects to a monster
func apply_to(monster):
	monster.health += health_boost
	monster.stamina += stamina_boost
	monster.healing = healing_aura
	monster.grass = grass_defense
	monster.slowing = slowing_aura
	monster.invis = invisibility

func combine_potions(potion1, potion2):
	var combined_pot = Potion.new()
	if (potion1.name == 'red' and potion2.name == 'yellow') or (potion1.name == 'yellow' and potion2.name == 'red'): 
		combined_pot.name = 'orange'
		combined_pot.healing_aura = true
	if (potion1.name == 'yellow' and potion2.name == 'blue') or (potion1.name == 'blue' and potion2.name == 'yellow'):
		combined_pot.name = 'green'
		combined_pot.grass_defense = true
	if (potion1.name == 'red' and potion2.name == 'blue') or (potion1.name == 'blue' and potion2.name == 'red'):
		combined_pot.name = 'purple'
		combined_pot.invisibility = true
	return combined_pot
