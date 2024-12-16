extends Area2D


func _ready():
	var overlapping_bodies = get_overlapping_areas()
	print(overlapping_bodies)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_ready()
