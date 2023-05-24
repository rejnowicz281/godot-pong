extends Area2D

var velocity = Vector2.ZERO

func reset():
	global_position.x = DisplayServer.window_get_size().x / 2
	velocity.x = [-1,1][randi() % 2]
	velocity.y = 0
	global_position.y = DisplayServer.window_get_size().y / 2

func _ready():
	reset()

func _physics_process(delta):
	position.x += velocity.x * 15
	position.y += velocity.y * 60
	
	if position.x > DisplayServer.window_get_size().x or position.x < 0:
		reset()
	elif position.y > DisplayServer.window_get_size().y or position.y < 0:
		velocity.y *= -1

func _on_body_entered(body):
	if body.name == "Paddle1" or body.name == "Paddle2":
		var paddle_pos_y = body.global_position.y
		var paddle_height = body.get_node("Sprite2D").get_rect().size.y
		
		velocity.x *= -1
		velocity.y = -(
			(global_position.y - paddle_pos_y) / paddle_height/2
		)
