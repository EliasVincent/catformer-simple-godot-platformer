extends Area2D

onready var aniPlayer: AnimationPlayer = get_node("AnimationPlayer")

func _on_Coin_body_entered(body):
	if body.is_in_group("player"):
		aniPlayer.play("fade_out")
