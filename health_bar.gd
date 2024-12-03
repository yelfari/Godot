extends ProgressBar

@onready var timer = $Timer
@onready var dmg_bar = $damageBar

var health = 0 : set = _set_health

func _set_health(new_health):
	var prev_health = health
	health = min(max_value,new_health)
	value = health
	
	if health <= 0:
		queue_free()
		
	if health < prev_health:
		timer.start()
	else:
		dmg_bar.value = health
		
func init_health(_health):
	health = _health
	max_value = health
	value = health
	dmg_bar.max_value = health
	dmg_bar.value = health
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	dmg_bar.value = health
