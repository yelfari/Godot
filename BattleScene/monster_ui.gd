extends Control

var attackDict = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var key_for_pokemon = -1
	for key in Game.dataBasePokemon.keys():
		if Game.dataBasePokemon[key]["Name"] == BattleSpawner.enemy_Pokemon:
			key_for_pokemon = key
			print_debug("key: " , key_for_pokemon)
			break
	$HPBar.value = Game.dataBasePokemon[key_for_pokemon]["Health"]
	$Info.text = str(Game.dataBasePokemon[key_for_pokemon]["Name"]) + " L" + str(Game.dataBasePokemon[key_for_pokemon]["lvl"])
	$HpText.text = str(Game.dataBasePokemon[key_for_pokemon]["Health"])
	if !TurnController.myTurn:
		$"..".enemyAttack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
