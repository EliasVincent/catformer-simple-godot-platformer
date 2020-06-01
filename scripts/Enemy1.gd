extends KinematicBody2D

var area = Area2D
var velocity = Vector2()
const SPEED = 100
const GRAVITY = 10
const JUMPFORCE = -220
const FLOOR = Vector2(0, -1)


var direction = 1

onready var aniPlayer2: AnimationPlayer = get_node("AnimationPlayer")

func _ready():
	set_physics_process(false) # deactivates enemy when not in view -> performance
	

func deathsound():
	# BROKEN AAAAA
	$DeathAudioPlayer.play()
func disableCollision():
	get_node("CollisionShape2D").disabled = true # when you jump you don't stop
	
func _on_Area2D_StompDetector_body_entered(body) -> void:
	# check if the body is lower than the area
	if body.global_position.y > get_node("Area2D_StompDetector").global_position.y:
		return
	$EnemyExplosion.show()
	aniPlayer2.play("death")

func _physics_process(delta): 
	velocity.x = SPEED * direction # calculates direction the enemy moves towards
	velocity.y = velocity.y + GRAVITY
	
	# with animations
	# if direction == 1:
		#$AnimatedSprite.flip_h = false
	#else:
		#$AnimatedSprite.flip_h = true
	#$AnimatedSprite.play("animationName")
	
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1 # "flips" the direction, und - plus - ist ja plus, also geht es in beide Richtungen
		# but the RayCast still needs to be flipped
		$RayCast2D.position.x *= -1 # will put it on the other side of the enemy
	# make sure the RayCast Arrow is underneath the enemie's collisionshape
	if !$RayCast2D.is_colliding(): # "!variable" means ""== false"
		direction = direction * -1 # the same thing above, when it's "not colliding"
		$RayCast2D.position.x *= -1
		
	#if $RayCast_Top.is_colliding():
		#queue_free()
	

