extends ProgressBar

@export var health = 50
@onready var character = $MyPlayer

func _ready():
	pass	
func _on_character_damage_taken(impact):
	# Update health bar according to character's current HP
	pass
	# do something else ...
