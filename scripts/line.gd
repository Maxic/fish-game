extends Line2D

var global_line_origin: Vector2
var window_size = Vector2(320, 480)
@onready var sprite_position = get_node("../Sprite2D").position
var points_amount = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	global_line_origin = Vector2(window_size.x/2, 0)
	for i in range(0, points_amount):
		add_point(to_local(global_line_origin))
	points[points_amount-1] = sprite_position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_rotation = 0
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		0	
	)
	
	if GameState.game_over:
		direction = Vector2(0,0)
	
	# Get new origin point
	var new_x_pos: float 
	if direction.x == 0:
		new_x_pos = lerp(global_line_origin.x, (self.global_position).x, .05)
	else:
		new_x_pos = global_line_origin.x + (direction.normalized().x * 6)
	
	# Clamp origin so it doesnt go all the way out there
	global_line_origin.x = clamp(new_x_pos, 0, window_size.x)
	
	var weight: float = 1
	var offset: float = .005
	var weight_step: float = weight/(points_amount-1)
	
	for i in range(0, points_amount):
		var straight_line_point = to_local(to_global(points[points.size()-1]).lerp(global_line_origin, weight))
		points[i] = Vector2(straight_line_point.x*(i*offset+1), straight_line_point.y)
		weight -= weight_step
	
	points[points_amount-1] = to_local(to_global(Vector2(sprite_position.x, sprite_position.y)))
	
