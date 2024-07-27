extends Line2D

var global_line_origin: Vector2
@onready var window_size = get_window().size

# Called when the node enters the scene tree for the first time.
func _ready():
	global_line_origin = Vector2(window_size.x/2, 0)
	add_point(to_local(global_line_origin))
	add_point(Vector2(-2,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		0	
	)
	var new_x_pos 
	
	if direction.x == 0:
		new_x_pos = lerp(global_line_origin.x, (self.global_position).x, .05)
	else:
		new_x_pos = global_line_origin.x + (direction.normalized().x * 3)
	
	global_line_origin.x = clamp(new_x_pos, 0, window_size.x)
	points[0] = to_local(global_line_origin)
