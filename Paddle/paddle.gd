extends CharacterBody2D

const SPEED = 1000.0
var score = 0
var direction

func _physics_process(delta):
	if name == "Paddle1":
		direction = Input.get_axis("ui_w", "ui_s")
	elif name == "Paddle2":
		direction = Input.get_axis("ui_up", "ui_down")
		
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
