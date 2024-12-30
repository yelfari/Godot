extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:
		if  str(body.name) == "Spawner":
			#get the parent, here : the player himself
			var parent = get_parent()
			#get the LevelName to spawn Random Pokemon which fit
			var LevelName = parent.get_parent().name
			var randomInt = randi_range(1,10)
			#print_debug(randomInt)
			if randomInt > 7 and GlobalTimer.timeIsUp == true:
				var pokemon_list = Game.pokemon_levelMap.get(LevelName, [])
				print(pokemon_list)
				var enemyPokemon = pokemon_list[randi() % pokemon_list.size()]
				BattleSpawner.initiateFight(enemyPokemon)
