extends AnimatedSprite2D

signal Mara_Away

func clicked_on():
	play("clicked")
	Mara_Away.emit()
