extends CharacterBody2D


const SPEED = 1000.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_w", "ui_s")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
