extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * 300
	move_and_slide()
