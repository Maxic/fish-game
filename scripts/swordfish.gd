extends Node2D

@onready var hook: Node = get_parent().get_node("hook")
var direction: Vector2
var speed: float = .55

func _physics_process(delta):
	
	# look at hook, correct orientation
	var absolute_degrees = abs(int(rotation_degrees)%360)
	if absolute_degrees > 90 and absolute_degrees < 270:
		$AnimatedSprite2D.flip_v = true
	else:
		$AnimatedSprite2D.flip_v = false
	look_at(hook.position)

	direction = hook.position - self.position
	
	if not SceneManager.game_over:
		translate(direction.normalized() * speed)
