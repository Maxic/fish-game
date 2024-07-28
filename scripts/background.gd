extends Node2D


@export var speed: float = 1
var direction: Vector2 = Vector2(0,-1)
var scroll: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if scroll:
		translate(direction * speed)


func _on_visible_on_screen_notifier_2d_screen_exited():
	scroll = false
	GameState.bottom_reached = true
