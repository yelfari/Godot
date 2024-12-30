extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pokemonDictKey = -1
	for key in Game.dataBasePokemon.keys():
		if Game.dataBasePokemon[key]["Name"] == BattleSpawner.enemy_Pokemon:
			pokemonDictKey = key
			print_debug("key: " , pokemonDictKey)
			break
	$HPBar.value = Game.dataBasePokemon[pokemonDictKey]["Health"]
	$Info.text = str(Game.dataBasePokemon[pokemonDictKey]["Name"]) + " L" + str(Game.dataBasePokemon[pokemonDictKey]["lvl"])
	$HpText.text = str(Game.dataBasePokemon[pokemonDictKey]["Health"])
	BattleSpawner.enemy_PokemonLvl = Game.dataBasePokemon[pokemonDictKey]["lvl"]
	if !TurnController.myTurn:
		$"..".enemyAttack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
