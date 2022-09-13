extends Control


var motion = Vector2()
var speed = 120
var gravity = 10
var jump = -250
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_select"):
		motion.x = 120
		$AudioStreamPlayer2D.play()
		get_tree().change_scene("res://Scene/Level_1.tscn")
pass
func _on_Button_pressed():
	$AudioStreamPlayer2D.play()
	get_tree().change_scene("res://Scene/Level_1.tscn")


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	pass # Replace with function body.
