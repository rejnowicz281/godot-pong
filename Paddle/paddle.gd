extends CharacterBody2D

const SPEED = 1000.0
var score = 0
var direction = 0
var bot = false

func bot_movement():
	var ball = get_parent().get_node("Ball")
	var paddle_top = $Sprite2D/Top.global_position.y
	var paddle_bottom = $Sprite2D/Bottom.global_position.y

	if ball.position.y > paddle_top and ball.position.y < paddle_bottom:
		direction = 0
	elif ball.position.y < paddle_top:
		direction = -1
	elif ball.position.y > paddle_bottom:
		direction = 1
	
func human_movement():
	if name == "Paddle1":
		direction = Input.get_axis("ui_w", "ui_s")
	else:
		direction = Input.get_axis("ui_up", "ui_down")

func _physics_process(delta):
	bot_movement() if bot else human_movement()
		
	velocity.y = direction * SPEED

	move_and_slide()
