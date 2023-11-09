# This script is an autoload, that can be accessed from any other script!

extends Node2D


var contador = 0
var aux : int
var score : int = 0
var tiempofinal = 0
# Adds 1 to score variable
func add_score():
	score += 1
	if score == 9:
		tiempofinal = contador
		get_tree().change_scene_to_file("res://Scenes/Levels/Ending.tscn")

	
# Loads next level
func load_next_level(next_scene : PackedScene):
	get_tree().change_scene_to_packed(next_scene)

func updateVal():
	contador += 1
	print(contador)

	
	
	

