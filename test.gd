extends Control

var element_scene: PackedScene # Reference to the Button scene

#TODO: fix that the children extend too low
#
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	element_scene = preload("res://player/buttonScene.tscn") # Path to the button scene (adjust the path)
	for i in Game.playerPokeMons: 
		print(Game.playerPokeMons[i]["Name"])
		var new_element = element_scene.instantiate() # Create a new instance
		$GridContainer/ScrollContainer/VBoxContainer.add_child(new_element) # Add the new button to the GridContainer
		new_element.changeText(Game.playerPokeMons[i]["Name"])
		var texture = Utils.pokemon_soloTexture[Game.playerPokeMons[i]["Name"]]
		new_element.changeTexture(texture)
		new_element.changeHPBar(Game.playerPokeMons[i]["CurrentHealth"])
		new_element.changeXPBar(Game.playerPokeMons[i]["Xp"])
		
		
func handleInput():
		if Input.is_action_just_pressed("openIngameMainMenu"):
				var new_element = element_scene.instantiate() # Create a new instance
				$GridContainer/ScrollContainer/VBoxContainer.add_child(new_element) # Add the new button to the GridContainer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		handleInput()
