tool # displays in viewport
extends Area2D

onready var portalAnimation: AnimationPlayer = $PortalAnimation

# identifies as scene files, now you see nextScene in the inspector
# putting it in a variable doesn't hardcode the level
export var nextScene: PackedScene 


func _on_Portal_body_entered(body):
	teleport()


# return error message when next scene is empty
func _get_configuration_warning() -> String:
	return "Next scene can't be empty, sorry!" if not nextScene else ""



func teleport():
	portalAnimation.play("fade_to_black")
	# yield waits for animation to finish "var of animation that has finished playing, signal to wait for"
	yield(portalAnimation, "animation_finished")
	get_tree().change_scene_to(nextScene)

