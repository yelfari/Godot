extends CanvasLayer

var pokemonInventory = preload("res://player/PokemonInventar.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Backgrounds/MenuBackground/middleButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_ingame_main_menu_button_focus_entered() -> void:
	$".".visible = false
	#$"..".gamePaused = false
	


func _on_open_pokemon_team_button_focus_entered() -> void:
	var InventoryScene = pokemonInventory.instantiate()
	get_parent().add_child(InventoryScene)
	get_tree().paused = true
	_on_close_ingame_main_menu_button_focus_entered()
