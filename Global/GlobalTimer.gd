extends Node 

var timer = Timer.new()
var timeIsUp : bool = true

func _ready():
	print("TIMER")
	timer.one_shot = true
	timer.timeout.connect(_on_timeout)
	
func start_timer(duration):
	timeIsUp = false
	add_child(timer)
	timer.start(duration)
	
func _on_timeout():
	print("UP")
	timeIsUp = true
	remove_child(timer)
	
func _process(delta: float) -> void:
	pass
