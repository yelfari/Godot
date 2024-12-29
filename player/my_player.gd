extends CharacterBody2D

class_name Player

@export var speed: int = 35
@onready var animations = $AnimationPlayer
#@onready var healthbar = $HealthBar
@export var maxHealth = 20
#@onready var currentHealth: int  =  maxHealths
@export var knockbackpower = 1000
var battle = preload("res://BattleScene/Battle.tscn")
var pokemonInventory = preload("res://player/PokemonInventar.tscn")
var pokedex = preload("res://player/pokedex.tscn")

func _ready():
	$IngameMainMenu.visible = false

func handleMovemenetInput():
	#Die Input-Vektoren habe ich unter "Projekt" -> "Projekteinstellungen" -> "Eingabe-Zuordnung" definiert
		var moveDirection = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = moveDirection * speed

func handeInput():
	################################################################################################
	#Open PokemonInventory
	# Toggle ingameMainMenu visibility and game pause state 
	if Input.is_action_just_pressed("openIngameMainMenu"):
		if Utils.gamePaused:
			# Toggle the gameState and hide the menu
			Utils.gamePaused = false
			$IngameMainMenu.visible = false
		else:
			# Toggle the gameState and show the menu
			Utils.gamePaused = true
			$IngameMainMenu.visible = true
			$IngameMainMenu/Backgrounds/MenuBackground/middleButton.grab_focus()
	if Input.is_action_just_pressed("openPokedex"):
		if !Utils.gamePaused:
			var pokedexScene = pokedex.instantiate()
			get_parent().add_child(pokedexScene)
			Utils.gamePaused = true
	if Input.is_action_just_pressed("openPokemonInventory"):
		if !Utils.gamePaused:
			var pokemonInventoryScene = pokemonInventory.instantiate()
			get_parent().add_child(pokemonInventoryScene)
			Utils.gamePaused = true
			
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

func _physics_process(_delta):
	handleMovemenetInput()
	handeInput()
	if !Utils.gamePaused:
		move_and_slide()
		#handleCollision()
		updateAnimation()

func knock_back(enemy):
	var knock_back_direction = (global_position - enemy.global_position).normalized() * knockbackpower
	velocity = knock_back_direction
	move_and_slide()
