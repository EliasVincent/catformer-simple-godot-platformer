extends Control


func _ready():
	pass


func _on_playbutton_pressed():
	get_tree().change_scene("res://scenes/Level1.tscn")
