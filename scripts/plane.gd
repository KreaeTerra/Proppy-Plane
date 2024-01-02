extends CharacterBody2D

@export var speed : int = 160
@export var gravity : int = 10
@export var terminal_velocity : int = 400

@export var lift_force : int = -30
@export var maximum_lift_speed : int = -100

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("ui_up") and velocity.y > maximum_lift_speed:
		velocity.y += lift_force
	velocity.x = direction * speed
	if velocity.y < terminal_velocity:
		velocity.y += gravity
	move_and_slide()
