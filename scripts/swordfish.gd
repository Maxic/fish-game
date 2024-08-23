extends Node2D

@onready var hook: Node = get_parent().get_node("hook")
var direction: Vector2
var speed: float = .65

func _physics_process(delta):
	
	# look at hook, correct orientation
	var absolute_degrees = abs(int(rotation_degrees)%360)
	if absolute_degrees > 90 and absolute_degrees < 270:
		$AnimatedSprite2D.flip_v = true
	else:
		$AnimatedSprite2D.flip_v = false
	look_at(hook.position)

	direction = hook.position - self.position
	
	if not (GameState.game_over or GameState.game_won):
		translate(direction.normalized() * speed)


func _on_area_2d_body_entered(body):
	if body.name == "hook":
		GameState.game_over = true
