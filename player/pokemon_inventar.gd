extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Add Pokémon to the game
	Game.addPokemon("Pikachu")

	# Get the player's Pokémon list
	var pokemonNameList = Game.getPlayerPokemonEntry("Plinfa")
	var playerPokemon1 = pokemonNameList  # Get the first Pokémon data (assumes it's a dictionary)
	print_debug(playerPokemon1)
	# Reference to the Tree node
	var tree = $Control/VBoxContainer/Tree
	
	

func _process(delta: float) -> void:
	pass
