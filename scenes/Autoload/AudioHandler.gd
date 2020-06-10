extends Node


func audioMuter():
	AudioServer.set_bus_mute(0, true)

func musicMuter():
	AudioServer.set_bus_mute(1, true)

func _process(delta):
	if Input.is_action_just_pressed("toggle_audio"):
		AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
