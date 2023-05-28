extends Node

func reset():
	get_tree().paused = true
	$Paddle1.position = $Paddle1StartPos.position
	$Paddle2.position = $Paddle2StartPos.position
	$Ball.position = $BallStartPos.position
	$Ball.reset_velocity()

func _ready():
	reset()
	$Paddle1.bot = true

func _on_left_boundary_area_entered(area):
	$Paddle2.score += 1
	reset()

func _on_right_boundary_area_entered(area):
	$Paddle1.score += 1
	reset()

func _on_one_player_pressed():
	reset()
	$Paddle1.score = 0
	$Paddle2.score = 0
	$Paddle1.bot = true
	$Paddle2.bot = false
	$UI/Menu.visible = false

func _on_two_players_pressed():
	reset()
	$Paddle1.score = 0
	$Paddle2.score = 0
	$Paddle1.bot = false
	$Paddle2.bot = false
	$UI/Menu.visible = false
