extends Camera2D

@export var tilemap: TileMap
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var mapRect = $"../../TileMapLayerHolder/Ground".get_used_rect()
	#var tileSize = tilemap.cell_quadrant_size
	#var worldSizeInPixels = mapRect.size * tileSize
	#limit_right = worldSizeInPixels.x
	#limit_bottom = worldSizeInPixels.y
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
