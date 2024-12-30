extends Control


func _ready() -> void:
	$HPBar.value = Game.playerPokeMons[0]["CurrentHealth"]
	$Info.text = str(Game.playerPokeMons[0]["Name"]) + " L" + str(Game.playerPokeMons[0]["lvl"])
	$HpText.text = str(Game.playerPokeMons[0]["CurrentHealth"])
	#Set Attack Names
	for i in Game.playerPokeMons[0]["Attacks"]:
			var path = "AttackMenu/GridContainer/Attack" + str(((i)+1))
			get_node(path).text = Game.playerPokeMons[0]["Attacks"][i]["Name"]
			
func _on_fight_button_pressed() -> void:
	$Menu.hide()
	$AttackMenu.show()
	$AttackMenu/GridContainer/Attack1.grab_focus()
	$ActionLabel.text = "Choose an Attack"

func _on_back_pressed() -> void:
	$Menu.show()
	$AttackMenu.hide()
	#Hide also the SwitchMenu because the "Back" - Buttons are named the same
	$SwitchMenu.hide()
	$Menu/GridContainer/FightButton.grab_focus()
	$ActionLabel.text = "Choose an Option"

func _on_switch_button_pressed() -> void:
	print(Game.playerPokeMons)
	$Menu.hide()
	$SwitchMenu.show()
	#$SwitchMenu/GridContainer/Pokemon1.grab_focus()
	$ActionLabel.text = "Switch Your Pokemon!"
	BattleLogic.changeLabel($ActionLabel)
	for i in range(1, Game.playerPokeMons.size()):
		print(Game.playerPokeMons[i]["Name"])
		var path = "SwitchMenu/GridContainer/Pokemon" + str(((i)+1))
		get_node(path).text = Game.playerPokeMons[i]["Name"]

func _on_flee_button_pressed() -> void:
	$ActionLabel.text = str(Game.playerPokeMons[0]["Name"]) + " is fleeing"
	leaveBattle()

func leaveBattle() -> void:
	#await get_tree().create_timer(1).timeout
	var ui_scene = load("res://player/ui.tscn") # Replace with the actual path to the UI node
	var ui_instance = ui_scene.instantiate()	
	#make node part of the active scene Tree
	add_child(ui_instance)
	var animation_player = ui_instance.get_node("BattleSceneTransition")
	animation_player.play("TransIn")
	await get_tree().create_timer(1.5).timeout
	GlobalTimer.start_timer(5)
	get_tree().paused = false
	animation_player.play("TransOut")
	get_parent().visible = false
	await get_tree().create_timer(1.5).timeout
	get_parent().queue_free() 

func _process(delta: float) -> void:
	pass

func _on_Switchpokemon_2_focus_entered() -> void:
	var temp_pokemon = Game.playerPokeMons[0]
	Game.playerPokeMons[0] = Game.playerPokeMons[1]
	Game.playerPokeMons[1] = temp_pokemon
	get_node("..").freePlayerPokemon()
	get_node("..").instantiatePlayerPokemon(Game.playerPokeMons[0]["Name"])
	for i in range(1, Game.playerPokeMons.size()):
		print(Game.playerPokeMons[i]["Name"])
		var path = "SwitchMenu/GridContainer/Pokemon" + str(((i)+1))
		get_node(path).text = Game.playerPokeMons[i]["Name"]
	_ready()

func _on_Switchpokemon_3_focus_entered() -> void:
	var temp_pokemon = Game.playerPokeMons[0]
	Game.playerPokeMons[0] = Game.playerPokeMons[2]
	Game.playerPokeMons[2] = temp_pokemon
	get_node("..").freePlayerPokemon()
	get_node("..").instantiatePlayerPokemon(Game.playerPokeMons[0]["Name"])
	for i in range(1, Game.playerPokeMons.size()):
		print(Game.playerPokeMons[i]["Name"])
		var path = "SwitchMenu/GridContainer/Pokemon" + str(((i)+1))
		get_node(path).text = Game.playerPokeMons[i]["Name"]
	_ready()

func _on_Switchpokemon_4_focus_entered() -> void:
	var temp_pokemon = Game.playerPokeMons[0]
	Game.playerPokeMons[0] = Game.playerPokeMons[3]
	Game.playerPokeMons[3] = temp_pokemon
	get_node("..").freePlayerPokemon()
	get_node("..").instantiatePlayerPokemon(Game.playerPokeMons[0]["Name"])
	for i in range(1, Game.playerPokeMons.size()):
		print(Game.playerPokeMons[i]["Name"])
		var path = "SwitchMenu/GridContainer/Pokemon" + str(((i)+1))
		get_node(path).text = Game.playerPokeMons[i]["Name"]
	_ready()

func _on_Switchpokemon_5_focus_entered() -> void:
	var temp_pokemon = Game.playerPokeMons[0]
	Game.playerPokeMons[0] = Game.playerPokeMons[4]
	Game.playerPokeMons[4] = temp_pokemon
	get_node("..").freePlayerPokemon()
	get_node("..").instantiatePlayerPokemon(Game.playerPokeMons[0]["Name"])
	for i in range(1, Game.playerPokeMons.size()):
		print(Game.playerPokeMons[i]["Name"])
		var path = "SwitchMenu/GridContainer/Pokemon" + str(((i)+1))
		get_node(path).text = Game.playerPokeMons[i]["Name"]
	_ready()

func _on_Switchpokemon_6_focus_entered() -> void:
	var temp_pokemon = Game.playerPokeMons[0]
	Game.playerPokeMons[0] = Game.playerPokeMons[5]
	Game.playerPokeMons[5] = temp_pokemon
	get_node("..").freePlayerPokemon()
	get_node("..").instantiatePlayerPokemon(Game.playerPokeMons[0]["Name"])
	for i in range(1, Game.playerPokeMons.size()):
		print(Game.playerPokeMons[i]["Name"])
		var path = "SwitchMenu/GridContainer/Pokemon" + str(((i)+1))
		get_node(path).text = Game.playerPokeMons[i]["Name"]
	_ready()


# Constants for configuring catch chance.
const BASE_CATCH_CHANCE : float = 1  # Starting catch rate
const LEVEL_DISPARITY_THRESHOLD : int = 5 # Level difference after which catch chance increases
const LEVEL_DISPARITY_BOOST : float = 0.2 # Catch chance increase per level beyond threshold
const LOW_HP_THRESHOLD : float = 0.5   # Percentage below which HP influences the catch chance
const LOW_HP_CATCH_BOOST : float = 0.4 # Base bonus when below threshold
const HP_PERCENT_BONUS_MULTIPLIER : float = 1.0 # Multiplier for how much lower than threshold hp is

func _on_capture_button_focus_entered() -> void:
	var enemy_hp : int = $"../MonsterUI/HPBar".value
	var enemy_lvl : int = BattleSpawner.enemy_PokemonLvl
	var pokemon_lvl : int = Game.playerPokeMons[0]["lvl"]  # Player's active Pokémon level
	var catch_chance : float = calculate_catch_chance(enemy_hp, enemy_lvl, pokemon_lvl)
	print("Catch chance: ", catch_chance)
	var random_value = randf() # Generate random value between 0 and 1
	if random_value <= catch_chance:
		print("Caught!")
		$ActionLabel.text = "captured " + BattleSpawner.enemy_Pokemon 
		Game.addPokemon(BattleSpawner.enemy_Pokemon)
		print(Game.playerPokeMons[Game.playerPokeMons.size() - 1])
		Game.playerPokeMons[Game.playerPokeMons.size() - 1]["CurrentHealth"] = $"../MonsterUI/HPBar".value
		Game.playerPokeMons[Game.playerPokeMons.size() - 1]["lvl"] =  BattleSpawner.enemy_PokemonLvl
		get_node("..").freeEnemyPokemon()
		leaveBattle()
		# Add logic for pokemon catch e.g. Add to player's inventory, remove from battle, etc.
	else:
		print("Not caught.")

# Function for calculating the catch chance
func calculate_catch_chance(enemy_hp : int, enemy_lvl : int, pokemon_lvl : int) -> float:
	var catch_chance : float = BASE_CATCH_CHANCE
	var level_difference : int = abs(enemy_lvl - pokemon_lvl)
	# Level discrepancy boost
	if level_difference > LEVEL_DISPARITY_THRESHOLD:
		catch_chance += LEVEL_DISPARITY_BOOST
	# HP-based boost
	var hp_percentage = float(enemy_hp) / 100.0
	if hp_percentage < LOW_HP_THRESHOLD:
		catch_chance = LOW_HP_CATCH_BOOST + (LOW_HP_THRESHOLD - hp_percentage) * HP_PERCENT_BONUS_MULTIPLIER
	# Ensure catch chance is within limits, optional but recommended.
	return clamp(catch_chance, 0.0, 1.0)
		
