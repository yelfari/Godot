extends Node


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass

func changeLabel(button):
	print_debug(button)
	button.text = "HIIII"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	#print_debug(tileMap, " HIII")
