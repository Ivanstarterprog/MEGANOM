extends AnimatedSprite2D

signal let_in_pushed

func clicked_on():
	play("clicked")
	emit_signal("let_in_pushed")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
