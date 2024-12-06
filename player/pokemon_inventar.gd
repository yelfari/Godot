extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.addPokemon("Pikachu")
	var pokemonNameList = Game.getPlayerPokemon()
	var playerPokemon1 = pokemonNameList[0]
	$MenuBackground/PokemonMenuHolder1/Pokemon1.texture = load("res://art/Pokemon/Solo/{playerPokemon1}.png".format({"playerPokemon1": str(playerPokemon1)}))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
