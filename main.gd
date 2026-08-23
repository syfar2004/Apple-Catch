extends Node2D

var apple_scene = preload("res://apple.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_apple()
	
func _on_apple_caught() -> void:
	spawn_apple()

func spawn_apple() -> void:
	var apple = apple_scene.instantiate()
	add_child(apple)
	apple.position.x = randi_range(70,750)
	
	apple.caught.connect(_on_apple_caught)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
