extends CharacterBody2D

@onready var lower_pillar : Node = $LowerPillarBody

@export var speed : int = -160

func _ready():
	lower_pillar.position.y += randi() % 150
	position.y = randi() % 300
	velocity.x = speed

func _process(delta):
	move_and_slide()


func _on_lifetime_timeout():
	queue_free()
