extends Control

@onready var LabelFinal = $Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	LabelFinal.text = str(GameManager.tiempofinal)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
