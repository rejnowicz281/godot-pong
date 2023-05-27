extends Node

func reset():
	get_tree().paused = true
	$Paddle1.position = $Paddle1StartPos.position
	$Paddle2.position = $Paddle2StartPos.position
	$Ball.position = $BallStartPos.position
	$Ball.reset_velocity()

func _ready():
	reset()

func _on_left_boundary_body_entered(body):
	$Paddle2.score += 1
	reset()

func _on_right_boundary_body_entered(body):
	$Paddle1.score += 1
	reset()
