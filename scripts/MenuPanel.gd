extends Control


func _ready():
	pass


func _on_playbutton_pressed():
	get_tree().change_scene("res://scenes/Level1.tscn")


func _on_linkbutton_pressed():
	OS.shell_open("http://godotengine.org")


func _on_aboutbutton_pressed():
	$"about-button/about-panel".show()
