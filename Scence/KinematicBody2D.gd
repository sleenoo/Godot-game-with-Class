extends KinematicBody2D

var speed = -500
var motion = Vector2.ZERO
var player = null


func _physics_process(delta):
	motion = Vector2.ZERO
	if player:
		motion = position.direction_to(player.position) * speed
		motion = move_and_slide(motion)
	$AnimatedSprite.play("Walk")

func _on_Area2D_body_entered(body):
	if body.name == "player":
		player = body
	$AnimatedSprite.play("Walk")

func _on_Area2D_body_exited(body):
	player = null
	$AnimatedSprite.play("Walk")

func _on_Area2D2_body_entered(body):
	if body.name == "player":
		queue_free()

