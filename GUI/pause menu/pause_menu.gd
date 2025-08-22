extends Control

func _ready():
	visible = false

func resume():
	get_tree().paused = false
	visible = false
	
func pause():
	get_tree().paused = true
	visible = true

func testEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause() # when pressing escape and it isn't paused, then pause it
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume() # when pressing escape and it is paused, then resume it



func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_return_pressed() -> void:
	get_tree().paused = false #if true, will have weird bug when in menu when you cannot go back to play or exit
	get_tree().change_scene_to_file("res://GUI/main menu/main_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _process(delta):
	testEsc()
