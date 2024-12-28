extends Control


func _ready() -> void:
	$HPBar.value = Game.playerPokeMons[get_parent().selected]["CurrentHealth"]
	$Info.text = str(Game.playerPokeMons[get_parent().selected]["Name"]) + " L" + str(Game.playerPokeMons[get_parent().selected]["lvl"])
	$HpText.text = str(Game.playerPokeMons[get_parent().selected]["CurrentHealth"])
	#Set Attack Names
	for i in Game.playerPokeMons[get_parent().selected]["Attacks"]:
			var path = "AttackMenu/GridContainer/Attack" + str(((i)+1))
			get_node(path).text = Game.playerPokeMons[get_parent().selected]["Attacks"][i]["Name"]
			
func _on_fight_button_pressed() -> void:
	$Menu.hide()
	$AttackMenu.show()
	$AttackMenu/GridContainer/Attack1.grab_focus()
	$ActionLabel.text = "Choose an Attack"

#BackButton From AttackMenu
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
	$ActionLabel.text = str(Game.playerPokeMons[get_parent().selected]["Name"]) + " is fleeing"
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
