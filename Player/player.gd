extends RigidBody3D

# need yawing and strafing
# need 1stpov and 3rdpov cams when moving

var mouse_sens := 0.001
var twist_input := 0.0
var pitch_input := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("ui_left","ui_right")
	input.y = Input.get_axis("ui_up","ui_down")
	input.z = Input.get_axis("ui_forwards","ui_backwards")
	apply_central_force(input * 1200.0 * delta)
	if Input.is_action_just_pressed(("ui_cancel")):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$TwistPivot.rotate_y(twist_input)
	$TwistPivot/PitchPivot.rotate_x(pitch_input)
	$TwistPivot/PitchPivot.rotation.x = clamp(
		$TwistPivot/PitchPivot.rotation.x,-0.5,0.5
	)
	
	

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sens
			pitch_input = - event.relative.y * mouse_sens
