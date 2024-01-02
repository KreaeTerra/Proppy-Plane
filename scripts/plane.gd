extends CharacterBody2D

@export var speed : int = 160

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	move_and_slide()
