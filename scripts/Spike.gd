extends StaticBody2D

func _ready():
	pass # Replace with function body.

func death():
	get_tree().change_scene("res://scenes/GameOverPanel.tscn")


func _on_A2D_Spike_StompDetector_body_entered(body):
	if body.is_in_group("player"):
		death()
