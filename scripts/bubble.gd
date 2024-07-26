extends Node2D

var speed: float
var direction: Vector2 = Vector2(0,-1)

func _ready():
	speed = randf_range(.7, 1.3)

func _physics_process(delta):
	translate(direction * speed)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
