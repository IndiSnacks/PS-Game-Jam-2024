extends Resource

class_name Potion

# Define the properties of a potion
var name: String
var health_boost: int = 0
var stamina_boost: int = 0
var healing_aura: bool = false
var grass_defense: bool = false
var slowing_aura: bool = false
var invisibility: bool = false

# Method to apply the potion effects to a monster
func apply_to(monster):
	monster.health += health_boost
	monster.stamina += stamina_boost
	monster.healing = healing_aura
	monster.grass = grass_defense
	monster.slowing = slowing_aura
	monster.invis = invisibility
