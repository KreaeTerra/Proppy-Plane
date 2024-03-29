extends Node2D

var Pillar : PackedScene = preload("res://scenes/pillars.tscn")

@onready var timer : Node = $PillarTimer
@onready var player : Node = $Plane

var score : int = 0

@export var scene_game_over : PackedScene

func _ready():
	randomize()
	player.get_node("Area2D").body_entered.connect(player_hits_obstacle)
	player.get_node("Area2D").area_entered.connect(player_passed_gap)
	
	$DeathBorder.area_entered.connect(player_hits_obstacle)
	spawn_pillar()

func _process(delta):
	Gamedata.score = score
	#TODO I need to make the gui set its own score and other variables instead of the world doing it
	$Gui/Label.text = "Score: " + str(score)

func spawn_pillar():
	timer.wait_time = 2.0
	timer.start()

func _on_pillar_timer_timeout():
	var pillar_instance = Pillar.instantiate()
	pillar_instance.position.x = 800
	add_child(pillar_instance)
	timer.wait_time = randf_range(1.5, 4.0)
	timer.start()

func player_hits_obstacle(body):
	var game_over : Node = scene_game_over.instantiate()
	add_child(game_over)
	get_tree().paused = true

func player_passed_gap(area):
	score += 1
