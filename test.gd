extends Control

var element_scene: PackedScene # Reference to the Button scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$elementSelector/AllPokemonFilter.grab_focus()
func handleInput():
		if Input.is_action_just_pressed("openIngameMainMenu"):
			var new_element = element_scene.instantiate() # Create a new instance
			$GridContainer/GridContainer.add_child(new_element) # Add the new button to the GridContainer
		if Input.is_action_just_pressed("openPokedex"):
			await get_tree().create_timer(0.2).timeout
			get_parent().queue_free()
			Utils.gamePaused = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handleInput()

func _on_all_pokemon_filter_focus_entered() -> void:
	clearElements()
	$Background.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	element_scene = preload("res://player/buttonScene.tscn") # Path to the button scene (adjust the path)
	for i in Game.playerPokeMons: 
		print(Game.playerPokeMons[i]["Name"])
		var new_element = element_scene.instantiate() # Create a new instance
		$GridContainer/GridContainer.add_child(new_element) # Add the new button to the GridContainer
		var texture = Utils.pokemon_soloTexture[Game.playerPokeMons[i]["Name"]]
		new_element.changeTexture(texture)
		new_element.changeHPBar(Game.playerPokeMons[i]["CurrentHealth"])
		new_element.changeXPBar(Game.playerPokeMons[i]["Xp"])
		new_element.changeName(Game.playerPokeMons[i]["Name"])	
		new_element.changeID(Game.playerPokeMons[i]["ID"])

func _on_fire_pokemon_filter_focus_entered() -> void:
	clearElements()
	element_scene = preload("res://player/buttonScene.tscn") # Path to the button scene (adjust the path)
	for i in Game.playerPokeMons: 
		if Game.playerPokeMons[i]["Type"][0] == "Fire":
			var new_element = element_scene.instantiate() # Create a new instance
			$GridContainer/GridContainer.add_child(new_element) # Add the new button to the GridContainer
			var texture = Utils.pokemon_soloTexture[Game.playerPokeMons[i]["Name"]]
			new_element.changeTexture(texture)
			new_element.changeHPBar(Game.playerPokeMons[i]["CurrentHealth"])
			new_element.changeXPBar(Game.playerPokeMons[i]["Xp"])
			new_element.changeName(Game.playerPokeMons[i]["Name"])

func _on_water_pokemon_filter_focus_entered() -> void:
	clearElements()
	element_scene = preload("res://player/buttonScene.tscn") # Path to the button scene (adjust the path)
	for i in Game.playerPokeMons: 
		if Game.playerPokeMons[i]["Type"][0] == "Water":
			var new_element = element_scene.instantiate() # Create a new instance
			$GridContainer/GridContainer.add_child(new_element) # Add the new button to the GridContainer
			var texture = Utils.pokemon_soloTexture[Game.playerPokeMons[i]["Name"]]
			new_element.changeTexture(texture)
			new_element.changeHPBar(Game.playerPokeMons[i]["CurrentHealth"])
			new_element.changeXPBar(Game.playerPokeMons[i]["Xp"])
			new_element.changeName(Game.playerPokeMons[i]["Name"])	

func _on_plant_pokemon_filter_focus_entered() -> void:
	clearElements()
	element_scene = preload("res://player/buttonScene.tscn") # Path to the button scene (adjust the path)
	for i in Game.playerPokeMons: 
		if Game.playerPokeMons[i]["Type"][0] == "Plant":
			var new_element = element_scene.instantiate() # Create a new instance
			$GridContainer/GridContainer.add_child(new_element) # Add the new button to the GridContainer
			var texture = Utils.pokemon_soloTexture[Game.playerPokeMons[i]["Name"]]
			new_element.changeTexture(texture)
			new_element.changeHPBar(Game.playerPokeMons[i]["CurrentHealth"])
			new_element.changeXPBar(Game.playerPokeMons[i]["Xp"])
			new_element.changeName(Game.playerPokeMons[i]["Name"])	

func _on_lightning_pokemon_filter_focus_entered() -> void:
	clearElements()
	element_scene = preload("res://player/buttonScene.tscn") # Path to the button scene (adjust the path)
	for i in Game.playerPokeMons: 
		if Game.playerPokeMons[i]["Type"][0] == "Lightning":
			var new_element = element_scene.instantiate() # Create a new instance
			$GridContainer/GridContainer.add_child(new_element) # Add the new button to the GridContainer
			var texture = Utils.pokemon_soloTexture[Game.playerPokeMons[i]["Name"]]
			new_element.changeTexture(texture)
			new_element.changeHPBar(Game.playerPokeMons[i]["CurrentHealth"])
			new_element.changeXPBar(Game.playerPokeMons[i]["Xp"])
			new_element.changeName(Game.playerPokeMons[i]["Name"])	

func _on_flight_pokemon_filter_focus_entered() -> void:
	clearElements()
	element_scene = preload("res://player/buttonScene.tscn") # Path to the button scene (adjust the path)
	for i in Game.playerPokeMons: 
		if Game.playerPokeMons[i]["Type"][0] == "Flight":
			var new_element = element_scene.instantiate() # Create a new instance
			$GridContainer/GridContainer.add_child(new_element) # Add the new button to the GridContainer
			var texture = Utils.pokemon_soloTexture[Game.playerPokeMons[i]["Name"]]
			new_element.changeTexture(texture)
			new_element.changeHPBar(Game.playerPokeMons[i]["CurrentHealth"])
			new_element.changeXPBar(Game.playerPokeMons[i]["Xp"])
			new_element.changeName(Game.playerPokeMons[i]["Name"])	

func clearElements() -> void: 
	for child in $GridContainer/GridContainer.get_children():
		$GridContainer/GridContainer.remove_child(child)
		child.queue_free()  
