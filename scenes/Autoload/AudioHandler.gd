extends Node


func audioMuter():
	AudioServer.set_bus_mute(0, true)

func musicMuter():
	AudioServer.set_bus_mute(1, true)
