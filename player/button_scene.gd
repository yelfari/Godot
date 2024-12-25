extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func changeText(string : String) -> void:
	#$Pokemon0Container/PokemonHPText.text = string
	pass
func changeTexture(texture : Texture) -> void:
	$Pokemon0Container/PokemonTexture.texture = texture
func changeHPBar(value : int) -> void:
	$Pokemon0Container/PokemonHP.value = value
func changeXPBar(value : int) -> void:
	$Pokemon0Container/PokemonXP.value = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
