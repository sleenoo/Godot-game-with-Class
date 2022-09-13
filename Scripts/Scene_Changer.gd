extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func goto_scene(path, current_scene):
	var loader = ResourceLoader.load_interactive(path)
	
	var loading_bar = load("res://Scence/ProgressBar.tscn").instance()
	
	get_tree().get_root().call_deferred('add_child',loading_bar)
	while true:
		var err = loader.poll()
		if err == ERR_FILE_EOF:
			#Loading Complete
			var resource = loader.get_resource()
			get_tree().get_root().call_deferred('add_child',resource.instance())
			current_scene.queue_free()
			loading_bar.queue_free()
			break
		if err == OK:
			#still loading
			var progress = float (loader.get_stage())/loader.get_stage_count()
			loading_bar.value = progress * 100
			print(progress)
