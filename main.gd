extends Node2D

var apple_scene = preload("res://apple.tscn")
var pause_menu = preload("res://pause_menu.tscn")
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

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		var pause_menu = pause_menu.instantiate()
		add_child(pause_menu)
		pause_menu.position.x = 307
		pause_menu.position.y = 53


func _on_timer_timeout() -> void:
	spawn_apple()
	print("hello")
