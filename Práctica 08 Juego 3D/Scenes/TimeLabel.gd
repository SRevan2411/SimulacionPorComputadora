extends Label

signal Power

var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Tiempo: %s" % GameManager.Counter
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_timer_timeout():
	GameManager.addTime()
	if GameManager.Counter % 6 == 0:
		Power.emit()
	if GameManager.Counter % 10 == 0:
		get_tree().change_scene_to_file("res://Scenes/stage2.tscn")
	text = "Tiempo: %s" % GameManager.Counter
	pass # Replace with function body.
