extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HPBar.value = Game.playerPokeMons[get_parent().selected]["Health"]
	$Info.text = str(Game.playerPokeMons[get_parent().selected]["Name"]) + " L" + str(Game.playerPokeMons[get_parent().selected]["lvl"])
	$HpText.text = str(Game.playerPokeMons[get_parent().selected]["Health"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
