extends Node2D


@export var speed: float = 70.0
var direction: Vector2 = Vector2(1,1)

const hook_fallback_lerp_weight = .02

func _physics_process(delta):
	
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"),	
	)
	
	direction = direction.normalized() * speed
	
	var sprite_rot = $Sprite2D.rotation
	
	# Rotate as if being dragged
	if abs(direction.x) < .01 and abs(direction.y) <.01:
		var look_at_point = Vector2(self.global_position.x, self.global_position.y+1)
		$Sprite2D.rotation = lerp_angle($Sprite2D.rotation, rotation + get_angle_to(look_at_point)-PI/2, hook_fallback_lerp_weight)
	else:
		var look_at_point = self.global_position +(direction*-1)
		# don't rotate when going down, since we're already dropping down
		if look_at_point.y < self.global_position.y:
			look_at_point.y = self.global_position.y +2
		$Sprite2D.rotation = lerp_angle($Sprite2D.rotation, rotation + get_angle_to(look_at_point)-PI/2, hook_fallback_lerp_weight)

	translate(direction * delta)
	
	
