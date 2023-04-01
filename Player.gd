extends KinematicBody2D

const GRAVITY = 500
const MAX_SPEED = 500
const ACCEL = 200
const FRICTION = 300
const JUMP = 300

onready var anim = $AnimatedSprite
var velocity = Vector2.ZERO
var can_jump = true

func _ready():
	anim.play('idle')

func _process(delta):
	if Input.is_action_pressed('ui_right'):
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL * delta)
		$AnimatedSprite.flip_h = false
		#anim.play("walk")

	elif Input.is_action_pressed('ui_left'):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL * delta)
		$AnimatedSprite.flip_h = true
		#anim.play("walk")
		
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	if Input.is_action_pressed('ui_down'):
		velocity.y = move_toward(velocity.y, MAX_SPEED, ACCEL * delta)
		#anim.play("jump")
	elif Input.is_action_pressed('ui_up') and can_jump:
		#anim.play("jump")
		if velocity.y == 0:
			velocity.y = -JUMP
			can_jump = false
	if(velocity.y != 0):
		anim.play("jump")
	elif velocity.x != 0:
		anim.play("walk")
	else:
		anim.play("idle")
	

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if velocity.y == 0:
		can_jump = true
