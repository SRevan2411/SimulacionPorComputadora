extends Label

@onready var CoinPlayer = $"../CoinPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Puntaje: %s" % GameManager.Score
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mob_squashed():
	GameManager.addScore()
	
	text = "Puntaje: %s" % GameManager.Score

func _on_coin_picked():
	CoinPlayer.play()
	text = "Puntaje: %s" % GameManager.Score
	pass


func _on_coin_2_picked():
	CoinPlayer.play()
	text = "Puntaje: %s" % GameManager.Score
	pass # Replace with function body.


func _on_coin_3_picked():
	CoinPlayer.play()
	text = "Puntaje: %s" % GameManager.Score
	pass # Replace with function body.
