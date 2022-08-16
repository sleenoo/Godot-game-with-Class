extends KinematicBody2D

var motion = Vector2()
func _process(delta):

	motion = move_and_slide(motion,Vector2.UP)
	pass
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 95
	elif Input.is_action_pressed("ui_left"):
		motion.x = -95
	else:
		motion.x = 0
	if is_on_floor() == false:
		motion.y +=
		pass
	pass
