extends CanvasLayer


func _ready():
	$HitSoundPlayer.play()


func _on_Retry_Button_pressed():
	get_tree().change_scene("res://scenes/Level1.tscn")
