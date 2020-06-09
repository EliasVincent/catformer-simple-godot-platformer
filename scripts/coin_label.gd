extends Label

func _process(delta):
	# Coin Counter
	text = ""
	text +="COINS: " + str(CatData.CoinCount)
