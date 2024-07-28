extends Node2D

@onready var anglerfish_scene = preload("res://scenes/anglerfish.tscn")
@onready var shark_scene = preload("res://scenes/shark.tscn")
@onready var window_size = get_window().size
var timer_started: bool = false


func _ready():
	randomize()

func _physics_process(delta):
	if GameState.middle_reached and not timer_started:
		timer_started = true
		$Timer.start()

func _on_timer_timeout():
	var spawn_pos_x = [-20, window_size.x+20][randi() % 2]
	var fish_arr = [shark_scene, anglerfish_scene]
	var fish_scene = fish_arr[randi() %fish_arr.size()]
	
	var fish = fish_scene.instantiate()
	if spawn_pos_x > 0:
		fish.flipped = true
	
	if GameState.bottom_reached:
		fish.position = Vector2(spawn_pos_x, randi_range(0, window_size.y/2))
	else:
		fish.position = Vector2(spawn_pos_x, randi_range(window_size.y/2, window_size.y+(window_size.y/2)))
	get_parent().add_child(fish)
