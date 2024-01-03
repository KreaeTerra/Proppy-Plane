extends CanvasLayer

var score : int = 0
@onready var score_label : Label = $ScoreLabel

func _ready():
	score = Gamedata.score
	score_label.text = "YOU MANAGED TO GO THROUGH " + str(score) + " OBSTACLES"

func _input(event):
	if event.is_action_pressed("ui_restart"):
		get_tree().paused = false
		get_tree().reload_current_scene()
