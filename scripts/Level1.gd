extends Node2D

var score = 0

func _ready():
	pass

func _on_BlockCat_coinCollected():
	score = score + 1
