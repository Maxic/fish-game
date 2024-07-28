extends Node2D

var speed: float = 1
var direction: Vector2 = Vector2(1, 1)
var flipped: bool = false

func _ready():
	randomize()
	var anim_name = ["pink", "blue"][randi() % 2]
	$AnimatedSprite2D.play(anim_name)
	if flipped:
		direction.x = -1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.rotation_degrees *= -1
	direction.x *= randf_range(.3, 1.2)
	direction.y *= randf_range(.4, .6)


func _physics_process(_delta):
	if not SceneManager.game_over:
		translate(direction * speed)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "hook":
		SceneManager.game_over = true
