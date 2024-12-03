extends Area2D

var battle = preload("res://BattleScene/Battle.tscn")

func _on_area_entered(area: Area2D):
	if area.name == "hurtBox":
		var ui_scene = load("res://player/ui.tscn") # Replace with the actual path to the UI node
		var ui_instance = ui_scene.instantiate()	
		#make node part of the active scene Tree
		add_child(ui_instance)
		var animation_player = ui_instance.get_node("BattleSceneTransition")
		animation_player.play("TransIn")
		get_tree().paused = true
		await get_tree().create_timer(1.4).timeout
		var battleTemp = battle.instantiate()
		get_parent().add_child(battleTemp)
		queue_free()
	
 	# Replace with function body.
