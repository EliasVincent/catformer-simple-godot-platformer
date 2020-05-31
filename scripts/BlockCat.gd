extends KinematicBody2D

var velocity = Vector2(0,0)
var spawnPoint = Vector2(144, 110.566002)
const MAX_SPEED = 150 # do this HERE, then u only need to change this once
const GRAVITY = 10
const JUMPFORCE = -220
const ACCELERATION = 16
export var stomp_impulse: = 500

#func _on_Area2D_EnemyDetector_area_entered(area):
#	velocity = calculate_stomp_velocity(velocity, stomp_impulse)
	

func _on_Area2D_EnemyDetector_body_entered(body):
	if body.is_in_group("enemy"):
		# position = spawnPoint <- just puts player to coordinates, maybe useful for later things?
		
		death()

func _ready():
	var pos = get_position()
	print(pos)
	return pos
	
func death():
	get_tree().change_scene("res://scenes/GameOverPanel.tscn")

func _physics_process(delta):
	var friction = false
	
	if Input.is_action_pressed("right"):
		# now we want to make sure acceleration doesn't exceed the max speed, instead of if statements we use min
		velocity.x = min(velocity.x+ACCELERATION, MAX_SPEED) # sets the value equal to the smaller of the two values, meaning if accel is over the max speed, it will use the max speed
		$Sprite.play("walkright") #$ accesses the node's children / names of the animations in AnimatedSprite
		
	elif Input.is_action_pressed("left"):
		velocity.x = max(velocity.x-ACCELERATION, -MAX_SPEED) #use max because moving left is negative x speed
		$Sprite.play("walkleft")
		
	else:
		$Sprite.play("idle")
		friction = true
	
	
	velocity.y = velocity.y + GRAVITY # basically the gravity
	
	if Input.is_action_pressed("jump") and is_on_floor(): # just_pressed makes it a "press once" thing
		velocity.y = JUMPFORCE
		$JumpAudioPlayer.play()
		
	if is_on_floor():
		if friction == true:
			velocity.x = lerp(velocity.x,0,0.12)
	else:
		velocity.x = lerp(velocity.x,0,0.04)
		
	
	move_and_slide(velocity) # function of movement, variable is our velocity var with the Vector2.x
	velocity = move_and_slide(velocity, Vector2.UP) # fixes the infinitely adding gravity from the velocity.y + X thing
	
	if position.y > 367:
		death()
