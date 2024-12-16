extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func playTransIn():
	%BattleSceneTransition.play("TransIn")

func playTransOut():
	%BattleSceneTransition.play("TransOut")
