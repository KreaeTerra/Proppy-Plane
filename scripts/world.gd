extends Node2D

var Pillar : PackedScene = preload("res://scenes/pillars.tscn")

@onready var timer : Node = $PillarTimer

func _ready():
	randomize()
	spawn_pillar()


func spawn_pillar():
	timer.wait_time = 2.0
	timer.start()

func _on_pillar_timer_timeout():
	var pillar_instance = Pillar.instantiate()
	add_child(pillar_instance)
	timer.wait_time = randf_range(3, 4.5)
	timer.start()
