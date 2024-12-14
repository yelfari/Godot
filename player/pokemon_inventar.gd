extends CanvasLayer


# Called when the node enters the scene tree for the first time.[]{}
func _ready() -> void:

	$UIControl/GridContainer/Pokemon0Container/Pokemon0Button.grab_focus()
	for i in range(len(Game.playerPokeMons)): # Use range() for proper iteration
		var pokemon_name = Game.playerPokeMons[i]["Name"]
		var pokemon_Xp = Game.playerPokeMons[i]["Xp"]
		var pokemon_MaxXp = Game.playerPokeMons[i]["MaxXp"]
		var pokemon_MaxHealth = Game.playerPokeMons[i]["Health"]
		var pokemon_CurrentHealth = Game.playerPokeMons[i]["CurrentHealth"]
		# Construct the dynamic node paths
		var node_path = "UIControl/GridContainer/Pokemon" + str(i) + "Container"
		var node_Name = "UIControl/GridContainer/Pokemon" + str(i) + "Container/PokemonName"
		var node_path_texture = "UIControl/GridContainer/Pokemon" + str(i) + "Container/PokemonTexture"
		var node_path_HP = "UIControl/GridContainer/Pokemon" + str(i) + "Container/PokemonHP"
		var node_path_HPText = "UIControl/GridContainer/Pokemon" + str(i) + "Container/PokemonHPText"
		var node_path_Xp = "UIControl/GridContainer/Pokemon" + str(i) + "Container/PokemonXP"
		var node_path_XpText = "UIControl/GridContainer/Pokemon" + str(i) + "Container/PokemonXPText"
		# Load the specific Pokemon texture
		var texture_path = "res://art/Pokemon/Solo/" + pokemon_name + "Solo.png"
		var texture = load(texture_path)
		# Access the node dynamically and set the texture
		if has_node(node_path):
			#changes Name
			var pokemon_Name_node = get_node(node_Name)
			pokemon_Name_node.text = pokemon_name
			#changes Texture
			var pokemon_texture_node = get_node(node_path_texture)
			pokemon_texture_node.texture = texture
			#changes HPBar
			var pokemon_HP_node = get_node(node_path_HP)
			pokemon_HP_node.max_value = pokemon_MaxHealth
			pokemon_HP_node.value = pokemon_CurrentHealth
			#changes HPText
			var pokemon_HPText_node = get_node(node_path_HPText)
			pokemon_HPText_node.text = str(pokemon_CurrentHealth) +"/" + str(pokemon_MaxHealth) +" HP"
			#changes XPBar
			var pokemon_Xp_node = get_node(node_path_Xp)
			pokemon_Xp_node.max_value = pokemon_MaxXp
			pokemon_Xp_node.value = pokemon_Xp
			#changes XPText
			var pokemon_XpText_node = get_node(node_path_XpText)
			pokemon_XpText_node.text = str(pokemon_Xp) +"/" + str(pokemon_MaxXp) +"XP"
		else:
			print("Node not found: ", node_path)
	update_big_pokemon_descriptor(0)

func handeInput():
	print_debug("HALLO")
	if Input.is_key_pressed(KEY_I):	
		get_tree().paused = false
		queue_free()
func input() -> void:
	if Input.is_key_pressed(KEY_I):	
		get_tree().paused = false
		queue_free()

func _process(delta: float) -> void:
		handeInput()

func _on_pokemon_0_button_focus_entered() -> void:
	update_big_pokemon_descriptor(0)

func _on_pokemon_1_button_focus_entered() -> void:
	update_big_pokemon_descriptor(1)

func _on_pokemon_2_button_focus_entered() -> void:
	print_debug("HIII")
	update_big_pokemon_descriptor(2)

func _on_pokemon_3_button_focus_entered() -> void:
	update_big_pokemon_descriptor(3)

func _on_pokemon_4_button_focus_entered() -> void:
	update_big_pokemon_descriptor(4)

func _on_pokemon_5_button_focus_entered() -> void:
	update_big_pokemon_descriptor(5)

func update_big_pokemon_descriptor(index):
	# Construct paths dynamically based on index
	var container_path = "UIControl/GridContainer/Pokemon" + str(index) + "Container/"
	$BigPokemonDescriptor/PokemonTexture.texture = get_node(container_path + "PokemonTexture").texture
	$BigPokemonDescriptor/PokemonHP.value = get_node(container_path + "PokemonHP").value
	$BigPokemonDescriptor/PokemonHPText.text = get_node(container_path + "PokemonHPText").text
	$BigPokemonDescriptor/PokemonXP.value = get_node(container_path + "PokemonXP").value
	$BigPokemonDescriptor/PokemonXPText.text = get_node(container_path + "PokemonXPText").text
	$BigPokemonDescriptor/PokemonName.text = get_node(container_path + "PokemonName").text

	# Find the index of the selected Pokemon in Game.playerPokeMons
	var selected_index = 0
	for i in Game.playerPokeMons:
		if Game.playerPokeMons[i]["Name"] == $BigPokemonDescriptor/PokemonName.text:
			selected_index = i
			break

	# Update attacks and description for the selected Pokemon
	$BigPokemonDescriptor/PokemonDescription.text = Game.playerPokeMons[selected_index]["Description"]

	for i in Game.playerPokeMons[selected_index]["Attacks"]:
		var pokemon_attack_name_string = "BigPokemonDescriptor/VBoxContainer/Attack" + str(i) + "/PokemonAttackName"
		var pokemon_attack_damage_string = "BigPokemonDescriptor/VBoxContainer/Attack" + str(i) + "/PokemonAttackDamage"

		var pokemon_attack_name_node = get_node(pokemon_attack_name_string)
		var pokemon_attack_damage_node = get_node(pokemon_attack_damage_string)

		pokemon_attack_name_node.text = Game.playerPokeMons[selected_index]["Attacks"][i]["Name"]

		if Game.playerPokeMons[selected_index]["Attacks"][i]["Heal"] == 0:
			pokemon_attack_damage_node.text = str(Game.playerPokeMons[selected_index]["Attacks"][i]["Damage"]) + " DMG"
		else:
			pokemon_attack_damage_node.text = str(Game.playerPokeMons[selected_index]["Attacks"][i]["Heal"]) + " Heal"


func _on_pokemon_menu_close_button_focus_entered() -> void:
	get_tree().paused = false
	queue_free()
