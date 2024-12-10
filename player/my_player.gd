extends CharacterBody2D

class_name Player

@export var speed: int = 35
@onready var animations = $AnimationPlayer
@onready var healthbar = $HealthBar
@export var maxHealth = 20
@onready var currentHealth: int  =  maxHealth
@export var knockbackpower = 1000
var battle = preload("res://BattleScene/Battle.tscn")
var pokemonInventory = preload("res://player/PokemonInventar.tscn")
var last_tile_position = Vector2(-1, -1)
var battle_initiated = false
#try to access slimebattlescene
var mytileData : TileData
var tileMap : TileMap
var currentTile 
func _ready():
	tileMap = %TileMapStartingArea
	healthbar.init_health(maxHealth)
	healthbar.visible = false


func handeInput():
	#Die Input-Vektoren habe ich unter "Projekt" -> "Projekteinstellungen" -> "Eingabe-Zuordnung" definiert
	var moveDirection = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = moveDirection * speed
	################################################################################################
	#Open PokemonInventory
	if Input.is_key_pressed(KEY_I):
		var InventoryScene = pokemonInventory.instantiate()
		get_parent().add_child(InventoryScene)
		get_tree().paused = true
		
		
		#pass


func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = ""
		if velocity.x != 0:
			direction = "left" if velocity.x < 0 else "right"
		elif velocity.y != 0:
			direction = "up" if velocity.y < 0 else "down"
		animations.play("walk_" + direction)

func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var _collider = collision.get_collider()
		
func handleTileData():
	var player_position = position
	#print(player_position)
	var playerMapPosition = tileMap.local_to_map(player_position)
	mytileData = tileMap.get_cell_tile_data(1,playerMapPosition)
	print_debug(mytileData)
	var layername = tileMap.get_layer_name(1)
	if mytileData != currentTile:
		var randomInt = randi_range(1,10)
		print_debug(randomInt)
		if randomInt > 1:
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
			ui_instance.queue_free()
			
		
			
		print("different tile")
		currentTile = mytileData
	#pokemonSpawners <TileData#43318773508>, <TileData#43201332989>, <TileData#43285219074>,<TileData#43268441857>,<TileData#43251664640>
	#this doesnt work somehow the TileData changed after restarting
	
		
func _physics_process(_delta):
	handeInput()
	move_and_slide()
	handleCollision()
	updateAnimation()
	handleTileData()


func _on_hurt_box_area_entered(area: Area2D):
	if area.name == "hitBox":
		currentHealth -=1 
		if currentHealth <= 0:
			currentHealth = maxHealth
		healthbar.health = currentHealth
		healthbar.visible = true
		
func knock_back(enemy):
	var knock_back_direction = (global_position - enemy.global_position).normalized() * knockbackpower
	velocity = knock_back_direction
	move_and_slide()
	
