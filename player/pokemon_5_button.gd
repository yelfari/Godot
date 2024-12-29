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
	print( Game.playerPokeMons[5]["Name"])
	var temp_pokemon = Game.playerPokeMons[5]
	Game.playerPokeMons[5] = Game.playerPokeMons[data]
	Game.playerPokeMons[data] = temp_pokemon
	get_node("../../../..")._ready()
	
func _get_drag_data(position):
	# Use a control that is not in the tree
	var color = Color(1, 0, 0, 1)
	var cpb = ColorPickerButton.new()
	cpb.color = color
	cpb.size = Vector2(50, 50)
	set_drag_preview($"../../..")
	return 5
	
