extends CharacterBody2D

const SPEED = 500.0
var direction

func reset_velocity():
	velocity.y = 0
	velocity.x = [-1,1][randi() % 2]

func _physics_process(delta):
	var collision = move_and_collide(velocity * SPEED * delta)
	if collision:
		var collider = collision.get_collider()

		if collider.name == "Paddle1" or collider.name == "Paddle2":
			var paddle_pos_y = collider.position.y
			var paddle_height = collider.get_node("Sprite2D").get_rect().size.y
			velocity.y = -(position.y - paddle_pos_y) / paddle_height * 2

		velocity = velocity.bounce(collision.get_normal())
