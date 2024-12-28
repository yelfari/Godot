extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func changeTexture(texture : Texture) -> void:
	$Pokemon0Container/PokemonTexture.texture = texture
func changeHPBar(value : int) -> void:
	$Pokemon0Container/PokemonHP.value = value
func changeXPBar(value : int) -> void:
	$Pokemon0Container/PokemonXP.value = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
func changeName(string : String) -> void:
	$Pokemon0Container/PokemonName.text = string
func changeID(randomID : int) -> void: 
	$Pokemon0Container/PokemonID.text = str(randomID)
func _process(delta: float) -> void:
	pass


func _on_pokemon_0_button_focus_entered() -> void:
	print($Pokemon0Container/PokemonID.text)
