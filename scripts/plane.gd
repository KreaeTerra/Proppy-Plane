extends CharacterBody2D

@export var speed : int = 160
@export var gravity : int = 10
@export var terminal_velocity : int = 400

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	print("vertical speed " , velocity.y)
	if velocity.y < terminal_velocity:
		velocity.y += gravity
	move_and_slide()
