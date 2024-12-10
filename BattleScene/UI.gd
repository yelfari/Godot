extends Control

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
	$Menu.hide()
	$SwitchMenu.show()
	$SwitchMenu/GridContainer/Pokemon1.grab_focus()
	$ActionLabel.text = "Switch Your Pokemon!"
	
	
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
	get_tree().paused = false
	animation_player.play("TransOut")
	get_parent().visible = false
	await get_tree().create_timer(1.5).timeout
	#get_tree().change_scene_to_file("res://world/world.tscn") MAY BE USEFUL FOR NEW LVL STARTS OR TELEPORTS
	#continues logic in world now
	#deletes the battleNode from Remote
	queue_free() 
func _process(delta: float) -> void:
	$HPBar.value = Game.playerPokeMons[get_parent().selected]["Health"]
	$Info.text = str(Game.playerPokeMons[get_parent().selected]["Name"]) + " L" + str(Game.playerPokeMons[get_parent().selected]["lvl"])
	$HpText.text = str(Game.playerPokeMons[get_parent().selected]["Health"])
	#Set Attack Names
	for i in Game.playerPokeMons[get_parent().selected]["Attacks"]:
			var path = "AttackMenu/GridContainer/Attack" + str(((i)+1))
			get_node(path).text = Game.playerPokeMons[get_parent().selected]["Attacks"][i]["Name"]
