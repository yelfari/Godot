extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	print($"../PokemonName".text)
	print( Game.playerPokeMons[3]["Name"])
	var temp_pokemon = Game.playerPokeMons[3]
	Game.playerPokeMons[3] = Game.playerPokeMons[data]
	Game.playerPokeMons[data] = temp_pokemon
	get_node("../../../..")._ready()
	
func _get_drag_data(at_position: Vector2) -> Variant:
	return 3
	
