extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = 600

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 2

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	var jump := Input.get_action_strength("jump")
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y -= jump * JUMP_VELOCITY
	
	velocity.x = direction * SPEED
	move_and_slide()
