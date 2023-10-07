extends Area2D

@export var amount: int = 1
@onready var start_y: float = global_position.y

var coin_height: float = 5.0
var coin_speed: float = 5.0
var t: float = 0.0

func _process(delta):
	t += delta
	
	var d = (sin(t*coin_speed)+1) / 2
	global_position.y = start_y + (d * coin_height)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(amount)
		queue_free()

