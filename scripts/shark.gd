extends Node2D

var speed: float = 1
var direction: Vector2 = Vector2(1, -1)
var flipped: bool = false

func _ready():
	randomize()
	if flipped:
		direction.x = -1
		$AnimatedSprite2D.flip_h = true
	direction.x *= randf_range(.3, 1.2)


func _physics_process(delta):
	translate(direction * speed)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
