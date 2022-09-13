extends Area2D

const speed = 250
var velocity = Vector2()
var EFFECT = preload("res://Scence/Particles2D.tscn")
var direction = 1
func _ready():
	print(global_position)
	pass
func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = speed * delta *direction
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	print("i'm out")
	queue_free()
	pass # Replace with function body.


func _on_Fireball_body_entered(body):
	if "Enemy" in body.name:
		queue_free() 

