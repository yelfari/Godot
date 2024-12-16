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
var gamePaused = false

func _ready():
	$IngameMainMenu.visible = false

func handleMovemenetInput():
	#Die Input-Vektoren habe ich unter "Projekt" -> "Projekteinstellungen" -> "Eingabe-Zuordnung" definiert
		var moveDirection = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = moveDirection * speed

func handeInput():
	################################################################################################
	#Open PokemonInventory
	if Input.is_key_pressed(KEY_I):
		var InventoryScene = pokemonInventory.instantiate()
		get_parent().add_child(InventoryScene)
		get_tree().paused = true
	# Toggle ingameMainMenu visibility and game pause state 
	if Input.is_action_just_pressed("openIngameMainMenu"):
		if gamePaused:
			# Toggle the gameState and hide the menu
			gamePaused = false
			$IngameMainMenu.visible = false
		else:
			# Toggle the gameState and show the menu
			gamePaused = true
			$IngameMainMenu.visible = true
			$IngameMainMenu/Backgrounds/MenuBackground/middleButton.grab_focus()
			
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
	if !gamePaused:
		move_and_slide()
		#handleCollision()
		updateAnimation()

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
