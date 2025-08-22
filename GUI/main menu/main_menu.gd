extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():

# ROV Rotating Code
	var animation_player = $"Main Menu/SubViewportContainer/SubViewport/ROV_placeholder/ROV_model/AnimationPlayer"
	if animation_player:
		animation_player.play("ROV_spinning")
		
		var animation = animation_player.get_animation("ROV_spinning")
		if animation:
			animation.loop_mode = animation.LOOP_LINEAR


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://environments/pool.tscn")
	# maybe can turn to another gui where player can decide levels
	# and when pressed specific level, player goes to that specific scene.
	
func _on_customize_pressed() -> void: # Customize ROV
	pass # Replace with function body. 

func _on_options_pressed() -> void: # maybe have some controls or something idk, adjust 'voltage'
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()
