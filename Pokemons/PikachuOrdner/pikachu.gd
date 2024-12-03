extends StaticBody2D


var Health = 20
var Level = 1

func _ready() -> void:
	$Aim/Attack.hide()
	spawn()
	
func spawn():
	$AnimationPlayer2.play("Spawn",-1,2)
