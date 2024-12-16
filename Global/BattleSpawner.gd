extends Node

var battle_scene = preload("res://BattleScene/Battle.tscn")
var ui_scene = preload("res://player/ui.tscn")
var enemy_Pokemon : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func initiateFight(enemyPokemon: String):
	print("BATTLE INITIATED")
	enemy_Pokemon = enemyPokemon
	var ui_instance = ui_scene.instantiate()	
	#make node part of the active scene Tree
	add_child(ui_instance)
	var animation_player = ui_instance.get_node("BattleSceneTransition")
	animation_player.play("TransIn")
	get_tree().paused = true
	await get_tree().create_timer(1.4).timeout
	var battleTemp = battle_scene.instantiate()
	get_parent().add_child(battleTemp)
	ui_instance.queue_free()
