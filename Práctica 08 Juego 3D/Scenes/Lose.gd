extends Control

@onready var TimeLabel = $TimeLabel
@onready var ScoreLabel = $ScoreLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	TimeLabel.text = str(GameManager.FinalTime) + " Puntos"
	ScoreLabel.text = str(GameManager.Counter) + " Segundos"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
