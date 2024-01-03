extends CanvasLayer

var score : int = 0
@onready var score_label : Label = $ScoreLabel

func _ready():
	score = Gamedata.score
	score_label.text = "YOU MANAGED TO GO THROUGH " + str(score) + " OBSTACLES"
