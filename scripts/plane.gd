extends CharacterBody2D

@export var speed : int = 160
@export var gravity : int = 10
@export var terminal_velocity : int = 400

@export var lift_force : int = -30
@export var maximum_lift_speed : int = -100

var can_control = false
var remaining_fuel : float = 100.00

func _process(delta):
	if can_control == true:
		var direction = Input.get_axis("ui_left", "ui_right")
		if Input.is_action_pressed("ui_up") and velocity.y > maximum_lift_speed:
			velocity.y += lift_force
		velocity.x = direction * speed
		if velocity.y < terminal_velocity:
			velocity.y += gravity
		tilt()
		move_and_slide()
		
		remaining_fuel -= 10 * delta
		Gamedata.fuel = remaining_fuel

func tilt():
	$Sprite.rotation = velocity.y * 0.0011
	$Area2D.rotation = velocity.y * 0.0011


func _on_intro_timer_timeout():
	can_control = true
