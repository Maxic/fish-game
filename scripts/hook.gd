extends CharacterBody2D

@export var speed: float = 70.0
var direction: Vector2 = Vector2(1,1)

const hook_fallback_lerp_weight = .02
var game_over: bool = false

func _physics_process(delta):
	if GameState.chest_grabbed:
		$point_left.disabled = true
	
	direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"),	
	)
	direction = direction.normalized() * speed
	
	# Game over, stop all movement
	if GameState.game_over or GameState.game_won:
		direction = Vector2(0,0)
	
	# Rotate as if being dragged
	if abs(direction.x) < .01 and abs(direction.y) <.01:
		var look_at_point = Vector2(self.global_position.x, self.global_position.y+1)
		rotation = lerp_angle(rotation, rotation + get_angle_to(look_at_point)-PI/2, hook_fallback_lerp_weight)
	else:
		var look_at_point = self.global_position +(direction*-1)
		# don't rotate when going down, since we're already dropping down
		if look_at_point.y < self.global_position.y:
			look_at_point.y = self.global_position.y +2
		rotation = lerp_angle(rotation, rotation + get_angle_to(look_at_point)-PI/2, hook_fallback_lerp_weight)

	translate(direction * delta)
	
func hit():
	GameState.game_over = true
