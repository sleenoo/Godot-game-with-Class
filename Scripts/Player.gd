extends KinematicBody2D

var motion = Vector2()
var speed = 100
var gravity = 10
var jump = -200
func _process(delta):

	motion = move_and_slide(motion,Vector2.UP)
	pass
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
	if is_on_floor() == false:
		motion.y += gravity
	
	if is_on_floor() == true && Input.is_action_pressed("ui_up") == true:
		motion.y =jump
pass
