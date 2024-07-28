extends Node2D

var speed: float = .9
var direction: Vector2 = Vector2(1, -1)
var flipped: bool = false

func _ready():
	randomize()
	if flipped:
		direction.x = -1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D/PointLight2D.position.x *= -1
	direction.x *= randf_range(.3, .4)


func _physics_process(delta):
	if not SceneManager.game_over:
		if GameState.bottom_reached:
			direction.y = 0	
		translate(direction * speed)
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
