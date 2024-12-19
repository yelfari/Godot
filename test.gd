extends Control

var button_scene: PackedScene # Reference to the Button scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		button_scene = preload("res://player/buttonScene.tscn") # Path to the button scene (adjust the path)

func handleInput():
		if Input.is_action_just_pressed("openIngameMainMenu"):
				var new_button = button_scene.instantiate() # Create a new button instance
				$GridContainer/ScrollContainer/VBoxContainer.add_child(new_button) # Add the new button to the GridContainer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		handleInput()
