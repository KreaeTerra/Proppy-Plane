extends Node2D

var Pillar : PackedScene = preload("res://scenes/pillars.tscn")

@onready var timer : Node = $PillarTimer
@onready var player : Node = $Plane/Area2D

var score : int = 0

@export var scene_game_over : PackedScene

func _ready():
	randomize()
	player.body_entered.connect(player_hits_obstacle)
	spawn_pillar()

func _process(delta):
	Gamedata.score = score

func spawn_pillar():
	timer.wait_time = 2.0
	timer.start()

func _on_pillar_timer_timeout():
	var pillar_instance = Pillar.instantiate()
	add_child(pillar_instance)
	timer.wait_time = randf_range(1.5, 4.0)
	timer.start()

func player_hits_obstacle(body):
	get_tree().change_scene_to_packed(scene_game_over)
