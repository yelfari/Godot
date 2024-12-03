extends CharacterBody2D

@export var speed = 10
@export var limit = 0.5
@export var maxHealth = 10
@export var character_name: String = "slimeMan"
@export var startinglvl : int = 1
@export var endPoint: Marker2D

@onready var animations = $AnimationPlayer
@onready var healthbar = $HealthBar

var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = endPoint.global_position
	healthbar.init_health(maxHealth)
	
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd
	
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
	
func updateVelocity():
	var moveDirection = endPosition - position
	if moveDirection.length() < limit:
		changeDirection()
	velocity =  moveDirection.normalized() * speed 
	
func _physics_process(_delta):
	updateVelocity()
	updateAnimation()
	move_and_slide()
