extends Node2D

func _ready():
	
	$AnimationPlayer.play("In")
	yield(get_tree().create_timer(3),"timeout")
	$AnimationPlayer.play("Out")
	yield(get_tree().create_timer(3),"timeout")
	get_tree().change_scene("res://Scence/Intro.tscn")
