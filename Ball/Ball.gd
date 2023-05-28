extends Area2D

const SPEED = 500.0
var velocity = Vector2.ZERO

func reset_velocity():
	velocity.y = 0
	velocity.x = [-1,1][randi() % 2]

func _physics_process(delta):
	position.x += velocity.x * SPEED * delta * 1.5
	position.y += velocity.y * SPEED * delta * 6  # Make ball move faster in the y-axis

func _on_body_entered(body):
	if body.name == "Paddle1" or body.name == "Paddle2":
		var paddle_pos_y = body.position.y
		var paddle_height = body.get_node("Sprite2D").get_rect().size.y
		
		velocity.y = -(position.y - paddle_pos_y) / paddle_height / 2
		velocity.x *= -1
	elif body.name == "TopWall" or body.name == "BottomWall":
		velocity.y *= -1
