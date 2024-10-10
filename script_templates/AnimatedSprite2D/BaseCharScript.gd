extends AnimatedSprite2D

signal guest_checked(type, is_let_in)

@export_group("Характеристики Персонажа")
@export var name_of_character: String
@export var is_monster: bool
@export var speed: int = 200

enum States {START, WAIT, GOHOME, GOIN}
enum VisualStates {REAL, DISGUASE, UNDISCLOSED}
var state: States = States.START
var visual_state: VisualStates = VisualStates.REAL
@onready var middle_point = $Points/MiddlePoint
@onready var let_in_point = $Points/LetInPoint
@onready var dont_let_in_point = $Points/DontLetInPoint
@onready var observer = self.get_parent()
@onready var id: int
@onready var is_let_in:bool

func clicked_on():
	print("Потом будем говорить фразу")
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if (is_monster == false):
		visual_state = VisualStates.REAL
	else:
		visual_state = VisualStates.DISGUASE
	observer.let_in.connect(StateLetIn)

func StateLetIn():
	if (state == States.WAIT):
		is_let_in = true
		state = States.GOIN

func StateDontLetIn():
	if (state == States.WAIT):
		is_let_in = false
		state = States.GOHOME
		visual_state = VisualStates.UNDISCLOSED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match visual_state:
		VisualStates.REAL:
			play("real")
		VisualStates.DISGUASE:
			play("disguase")
		VisualStates.DISGUASE:
			play("undisclosed")
	match state:
		States.START:
			position = position.move_toward(middle_point.position, delta * speed)
		States.GOHOME:
			position = position.move_toward(dont_let_in_point.position, delta * speed)
		States.GOIN:
			position = position.move_toward(let_in_point.position, delta * speed)
	if (position == middle_point.position) && (state == States.START):
		state = States.WAIT
	if ((position == let_in_point.position) || (position == dont_let_in_point.position)) && ((state == States.GOHOME) || (state == States.GOHOME)):
		guest_checked.emit() 
