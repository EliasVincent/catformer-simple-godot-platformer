extends KinematicBody2D

var velocity = Vector2(0,0)
var isDed = false
var spawnPoint = Vector2(144, 110.566002)
const SPEED = 150 # do this HERE, then u only need to change this once
const GRAVITY = 10
const JUMPFORCE = -220
export var stomp_impulse: = 500

#func _on_Area2D_EnemyDetector_area_entered(area):
#	velocity = calculate_stomp_velocity(velocity, stomp_impulse)
	

func _on_Area2D_EnemyDetector_body_entered(body):
	if body.is_in_group("enemy"):
		# position = spawnPoint <- just puts player to coordinates, maybe useful for later things?
		get_tree().reload_current_scene()
func _ready():
	var pos = get_position()
	print(pos)
	return pos

func _physics_process(delta):
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walkright") #$ accesses the node's children / names of the animations in AnimatedSprite
		
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walkleft")
		
	else:
		$Sprite.play("idle")
		
	
	
	velocity.y = velocity.y + GRAVITY # basically the gravity
	
	if Input.is_action_pressed("jump") and is_on_floor(): # just_pressed makes it a "press once" thing
		velocity.y = JUMPFORCE
	
	move_and_slide(velocity) # function of movement, variable is our velocity var with the Vector2.x
	velocity = move_and_slide(velocity, Vector2.UP) # fixes the infinitely adding gravity from the velocity.y + X thing
	
	velocity.x = lerp(velocity.x,0,0.2) # lerp makes velocity closer to 0 over time with the velocity value
	# the last value sets the speed of the slowdown
	if position.y > 367:
		print("H")
		get_tree().reload_current_scene()
#func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	#var out: = linear_velocity
	#out.y = -impulse 
	#return out


