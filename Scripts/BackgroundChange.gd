extends AnimatedSprite2D

@onready var current_time = "morning"
@onready var timer := Timer.new()
@export var GameTimeMinutes: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("Morning")
	add_child(timer)
	timer.wait_time = (60 * GameTimeMinutes) / 3
	timer.start()
	timer.timeout.connect(ChangeBackground)

func ChangeBackground() -> void:
	match(current_time):
		"morning":
			play("Day")
			current_time = "day"
		"day":
			play("Evening")
			current_time = "evening"
		"evening":
			print("GG")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
