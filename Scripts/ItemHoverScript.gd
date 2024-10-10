extends Area2D

@onready var Parent = self.get_parent()

@onready var HoverShader = preload("res://Shaders/ВыборЭлемента.gdshader")

@onready var clicked = false 

func _ready() -> void:
	Parent.material = ShaderMaterial.new()
	Parent.material.shader = HoverShader
	Parent.material.set_shader_parameter("on_off", false)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exit)
	input_event.connect(_on_Area2D_input_event)	
	
func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("LeftClick") && Parent.has_method("clicked_on"):
		Parent.clicked_on()
	if event.is_action_released("LeftClick") && Parent.has_method("return_to_base"):
		Parent.return_to_base()

func _on_mouse_entered() -> void:
	Parent.material.set_shader_parameter("on_off", true)
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	
func _on_mouse_exit():
	Parent.material.set_shader_parameter("on_off", false)
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
