extends KinematicBody2D

var motion = Vector2()
var speed = 385
var gravity = 25
var jump = -750
var DJ = false
const FIREBALL = preload("res://Scence/Fireball.tscn")
var on_ground = false
func _process(delta):
	motion = move_and_slide(motion,Vector2.UP)
	pass
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$Sprite.flip_h = false
		if is_on_floor():
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
			$AnimationPlayer.play("move")
	elif Input.is_action_pressed("ui_left"):
			motion.x = -speed
			$Sprite.flip_h = true
			$AnimationPlayer.play("move")
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
	else:
		motion.x = 0
		$AnimationPlayer.play("Idle")
		
	if is_on_floor() == false:
		
		motion.y += gravity
	if motion.y > gravity:
		$AnimationPlayer.play("Fall")
		if motion.y < -gravity:
			$AnimationPlayer.play("Jump")
	if is_on_floor():
		DJ = true
	if is_on_floor() == true && Input.is_action_pressed("ui_up") == true:
		
		motion.y =jump
		DJ = false
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("Attack")
		var fireball = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
		fireball.global_position = $Position2D.global_position
		get_parent().add_child(fireball)
		$AnimationPlayer.play("Attack")
pass






func _on_Area2D2_area_entered(area):
	if area.is_in_group("Enemy"):
		get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Scence/Menu.tscn")
	pass # Replace with function body.
