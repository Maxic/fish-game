extends Node2D

@onready var goldfish_scene = preload("res://scenes/goldfish.tscn")
@onready var greyfish_scene = preload("res://scenes/greyfish.tscn")
@onready var bluefish_scene = preload("res://scenes/bluefish.tscn")
@onready var window_size = Vector2(320, 480)

func _ready():
	randomize()


func _on_timer_timeout():
	if GameState.middle_reached:
		$Timer.stop()
	
	var spawn_pos_x = [-20, window_size.x+20][randi() % 2]
	var fish_arr = [goldfish_scene, greyfish_scene, bluefish_scene]
	var fish_scene = fish_arr[randi() %fish_arr.size()]
	
	var fish = fish_scene.instantiate()
	if spawn_pos_x > 0:
		fish.flipped = true
	
	if GameState.bottom_reached:
		fish.position = Vector2(spawn_pos_x, randi_range(0, window_size.y/2))
	else:
		fish.position = Vector2(spawn_pos_x, randi_range(window_size.y/2, window_size.y+(window_size.y/2)))
	get_parent().add_child(fish)
