extends Node2D

signal let_in
signal mara_away

@onready var people_letted_in = 0
@onready var fake_letted_in = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var let_in_button = get_node("Будка/КнопкаПропуска")
	let_in_button.let_in_pushed.connect(let_in_send)
	var mara_button = get_node("Будка/ОтМары")
	mara_button.Mara_Away.connect(mara_away_push)

func let_in_send():
	let_in.emit()

func mara_away_push():
	mara_away.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
