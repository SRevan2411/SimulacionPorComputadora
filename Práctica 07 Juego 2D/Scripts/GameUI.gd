extends Control

@onready var score_texture = %Score/ScoreTexture
@onready var score_label = %Score/ScoreLabel

@onready var time_label = %Timer/TimeLabel

func _process(_delta):
	# Set the score label text to the score variable in game maanger script
	score_label.text = "x %d" % GameManager.score
	time_label.text = "%d" % GameManager.contador
