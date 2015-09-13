
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var anim = ""

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
	
	if move_right:
		new_anim = "right"
	elif move_left:
		new_anim = "left"
	elif jump:
		new_anim = "jump"
	elif attack:
		new_anim = "basic"
	elif spin:
		new_anim = "spin"
	
	if(anim != new_anim):
		anim = new_anim
		
	self.get_node("AnimationPlayer").play(anim)
	new_anim = ""