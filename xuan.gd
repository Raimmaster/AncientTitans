
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var anim = ""
var velocidad = Vector2()

const GRAVITY = 500
const MOVE_SPEED = 50
const JUMP_SPEED = 300

func _ready():
	# Initialization here
	set_fixed_process(true) 
	pass

func _fixed_process(delta):
	var new_anim = ""
	var move_right = Input.is_action_pressed("move_right")
	var move_left = Input.is_action_pressed("move_left")
	var jump = Input.is_action_pressed("jump")
	var attack = Input.is_action_pressed("attack")
	var spin = Input.is_action_pressed("spin_attack")
	var special = Input.is_action_pressed("special_attack")
	
	velocidad.y += delta * GRAVITY
	if move_right:
		new_anim = "right"
		velocidad.x = MOVE_SPEED
	elif move_left:
		new_anim = "left"
		velocidad.x = - MOVE_SPEED
	elif jump:
		new_anim = "jump"
		velocidad.y = -JUMP_SPEED 
	elif attack:
		new_anim = "basic"
	elif spin:
		new_anim = "spin"
	elif special:
		new_anim = "special"
	else:
		velocidad.x = 0
		
	var motion = velocidad * delta
	motion = move(motion)
	
	if(anim != new_anim):
		anim = new_anim
		self.get_node("AnimationPlayer").play(anim)
		
	if(is_colliding()):
		var norm = get_collision_normal()
		velocidad.y = 0
		motion = norm.slide(motion)
		velocidad = norm.slide(velocidad)
		move(motion)