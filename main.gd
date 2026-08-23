extends Node2D

var apple_scene = preload("res://apple.tscn")
var score = 0
var lives = 3

func _ready() -> void:
	spawn_apple()
	
func _on_apple_caught() -> void:
	score += 1
	spawn_apple()
	$ScoreLabel.text = "Score: " + str(score)

func _on_miss_line_area_entered(area: Area2D) -> void:
	if area.is_in_group("apple"):
		lives -= 1
		$LivesLabel.text = "Lives: " + str(lives)
		area.queue_free()
		spawn_apple()
		
	if lives == 0:
		$GameOverLabel.visible = true
		get_tree().paused = true


func spawn_apple() -> void:
	var apple = apple_scene.instantiate()
	add_child(apple)
	apple.position.x = randi_range(70,750)
	
	apple.caught.connect(_on_apple_caught)
