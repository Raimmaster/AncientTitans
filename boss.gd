
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	set_fixed_process(true) 
	pass

func _fixed_process(delta):
	self.get_node("AnimationPlayer").play("walk")


