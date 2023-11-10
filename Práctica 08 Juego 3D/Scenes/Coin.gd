extends Node3D

@onready var AudioPlayer = $AudioStreamPlayer3D
signal picked


func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		GameManager.addTen()
		AudioPlayer.play()
		picked.emit()
		queue_free()
	
