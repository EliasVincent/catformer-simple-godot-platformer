extends Control


func _ready():
	pass


func _on_playbutton_pressed():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")


func _on_linkbutton_pressed():
	OS.shell_open("https://github.com/EliasVincent/simple-godot-platformer")


func _on_aboutbutton_pressed():
	$"about-button/about-panel".show()


func _on_Mute_Audio_Button_pressed():
	AudioHandler.audioMuter()


func _on_Mute_Musik_Button_pressed():
	AudioHandler.musicMuter()
