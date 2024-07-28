extends Node2D

@onready var jellyfish_scene = preload("res://scenes/jellyfish.tscn")
@onready var window_size = get_window().size

func _ready():
	randomize()

func _on_timer_timeout():
	$Timer.wait_time = randf_range(3, 7)
	
	if GameState.bottom_reached:
		$Timer.stop()
	
	var spawn_pos_x = [-20, window_size.x+20][randi() % 2]
	var fish_arr = [jellyfish_scene]
	var fish_scene = fish_arr[randi() %fish_arr.size()]
	
	var fish = fish_scene.instantiate()
	if spawn_pos_x > 0:
		fish.flipped = true
		
	fish.position = Vector2(spawn_pos_x, randi_range(0, window_size.y/2))
	
	get_parent().add_child(fish)
