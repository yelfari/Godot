extends CharacterBody2D

class_name Player

@export var speed: int = 35
@onready var animations = $AnimationPlayer
@onready var healthbar = $HealthBar
@export var maxHealth = 20
@onready var currentHealth: int  =  maxHealth
@export var knockbackpower = 1000

var last_tile_position = Vector2(-1, -1)
var battle_initiated = false
#try to access slimebattlescene
var mytileData : TileData
var tileMap : TileMap
var currentTile 
func _ready():
	currentTile
	tileMap = %TileMapStartingArea
	var tile_set = tileMap.tile_set
	#print_debug(tile_set)
	healthbar.init_health(maxHealth)
	healthbar.visible = false


func handeInput():
	#Die Input-Vektoren habe ich unter "Projekt" -> "Projekteinstellungen" -> "Eingabe-Zuordnung" definiert
	var moveDirection = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = moveDirection * speed
	################################################################################################
	#Open Pokemon Inventory
	#if Input.is_key_pressed(KEY_P):
		
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
	var layername = tileMap.get_layer_name(1)
	if mytileData != currentTile:
		print("different tile")
		currentTile = mytileData
	#print_debug(mytileData)
	#pokemonSpawners <TileData#43318773508>, <TileData#43201332989>, <TileData#43285219074>,<TileData#43268441857>,<TileData#43251664640>
	
		
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
	
