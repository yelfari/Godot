extends Node

var myTurn : bool = true
#This Script is only here to Manage the Turns in which the Battle is played in
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func changeTurn(label: Label):
	myTurn = !myTurn 
	if myTurn:
		label.text = "Your turn"
	else: 
		label.text = "Enemy turn"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
