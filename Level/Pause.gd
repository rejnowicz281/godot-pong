extends Node

func _input(event):
	if event.is_action_pressed("ui_select"):
		get_tree().paused = not get_tree().paused

func _process(delta):
	$Score.text = str($"../Paddle1".score) + "  -  " + str($"../Paddle2".score)
	if get_tree().paused:
		$State.text = "Press 'space' to resume"
	else:
		$State.text = "Press 'space' to pause"
