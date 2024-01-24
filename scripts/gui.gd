extends CanvasLayer


func _process(delta):
	$ProgressBar.value = Gamedata.fuel 
