extends Sprite2D

var clicked:bool = false
@onready var start_postition:Vector2 = position
func clicked_on():
	scale = Vector2(0.5, 0.5)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	clicked = true

func return_to_base():
	scale = Vector2(0.1, 0.1)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	clicked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if clicked == true:
		position = get_global_mouse_position()
	else:
		position = start_postition
