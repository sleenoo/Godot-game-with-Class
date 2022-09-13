extends KinematicBody2D
var is_dead = false
var velocity = Vector2()
var direction = 1
var speed = 100
const FIREBALL = preload("res://Scence/Fireball.tscn")
func _ready():
	pass 

func _dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimationPlayer.play("dead")
func _process(delta):
	if is_dead == false:
		velocity.x = speed * direction

func _on_Hitbox_body_entered(body):
	if body.is_in_group("Fireball"):
		queue_free()
		pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
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


func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"):
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


func _on_Area2D_area_entered(area):
	queue_free() 
