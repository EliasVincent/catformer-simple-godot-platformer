extends KinematicBody2D

var area = Area2D
var velocity = Vector2()
const SPEED = 100
const GRAVITY = 10
const JUMPFORCE = -220
const FLOOR = Vector2(0, -1)


var direction = 1

var is_dead = false

func _ready():
	area.connect("body_entered", self, "_on_Area2D_body_entered")

func dead():
	is_dead = true
	velocity = Vector2(0,0) # stop enemy

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
	
	if is_dead:
		queue_free()
	
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
	


func _on_Area2D_body_entered(body):
	if (body.get_name() == "BlockCat"):
		print("A")
