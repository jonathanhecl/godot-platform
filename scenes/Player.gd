extends CharacterBody2D

@export var ScoreLabel: Label
# @onready var ScoreLabel: Label = get_node("CanvasLayer/ScoreText")

var score: int = 0
var move_speed: float = 100.0
var jump: float = 200.0
var gravity: float = 500.0

func _physics_process(delta):
	if global_position.y > 100:
		game_over()
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	velocity.x = 0
		
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= move_speed
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += move_speed
	if Input.is_key_pressed(KEY_UP) and is_on_floor():
		velocity.y = -jump
		
	move_and_slide()

func game_over():
	get_tree().reload_current_scene()

func add_score(amount):
	score += amount
	ScoreLabel.text = str("Score: ", score)
