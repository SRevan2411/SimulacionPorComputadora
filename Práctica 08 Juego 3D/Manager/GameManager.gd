extends Node

var Score = 0
var Counter = 0
var Invisible = false
var FinalTime = 0

func endTime():
	FinalTime = Score

func addScore():
	Score += 1
func addTen():
	Score +=10
func addTime():
	Counter += 1

func Escudo():
	Invisible = true
func Romper():
	Invisible = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
