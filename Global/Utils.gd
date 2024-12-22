extends Node

var pokemon_scenes = {
	"Pikachu": preload("res://Pokemons/PikachuOrdner/Pikachu.tscn"),
	"Plinfa": preload("res://Pokemons/PlinfaOrdner/Plinfa.tscn"),
	"Schiggy": preload("res://Pokemons/SchiggyOrdner/Schiggy.tscn"),
	"Tragosso": preload("res://Pokemons/TragossoOrdner/Tragosso.tscn"),
	"Pummeluff": preload("res://Pokemons/PummeluffOrdner/Pummeluff.tscn"),
	"Raupy": preload("res://Pokemons/RaupyOrdner/Raupy.tscn"),
	"Taubsi": preload("res://Pokemons/TaubsiOrdner/Taubsi.tscn"),
	"Quapsel": preload("res://Pokemons/QuapselOrdner/Quapsel.tscn"),
	"Golbat": preload("res://Pokemons/GolbatOrdner/Golbat.tscn"),
	"Glumanda": preload("res://Pokemons/GlumandaOrdner/Glumanda.tscn"),
	"Rattfratz": preload("res://Pokemons/RattfratzOrdner/Rattfratz.tscn"),
	"Serpifeu": preload("res://Pokemons/SerpifeuOrdner/Serpifeu.tscn"),
}
var pokemon_soloTexture = {
	"Plinfa": load("res://art/Pokemon/Solo/PlinfaSolo.png"),
	"Pikachu": load("res://art/Pokemon/Solo/PikachuSolo.png"),
	"Schiggy": load("res://art/Pokemon/Solo/SchiggySolo.png"),
	"Glumanda": load("res://art/Pokemon/Solo/GlumandaSolo.png")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loadUIScene():
	#Load UI to battleScene for Transition
	var ui_scene = load("res://player/ui.tscn")
	var ui_instance = ui_scene.instantiate()	
	#make node part of the active scene Tree
	add_child(ui_instance)
	var animation_player = ui_instance.get_node("BattleSceneTransition")
	animation_player.play("TransOut")
	
