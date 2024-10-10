extends Node

@onready var middle_point = $MiddlePoint
@onready var let_in_point = $LetInPoint
@onready var dont_let_in_point = $DontLetInPoint
@onready var Parent = self.get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var time_position = Vector2(0, 0)
	time_position.x = get_viewport().get_visible_rect().size.x
	time_position.y = Parent.position.y
	let_in_point.position = time_position
	time_position.x = 0
	time_position.y = Parent.position.y
	dont_let_in_point.position = time_position
	time_position.x = get_viewport().get_visible_rect().size.x / 2
	time_position.y = Parent.position.y
	middle_point.position = time_position
