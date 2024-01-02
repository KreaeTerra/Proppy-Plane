extends CharacterBody2D

@onready var lower_pillar : Node = $LowerPillarBody

func _ready():
	randomize()
	lower_pillar.position.y += randi() % 150
	position.y = randi() % 300
