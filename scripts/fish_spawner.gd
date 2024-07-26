@tool
extends Node2D

@onready var goldfish_scene = preload("res://scenes/goldfish.tscn")
@onready var greyfish_scene = preload("res://scenes/greyfish.tscn")
@onready var window_size = get_window().size

func _ready():
	randomize()

func _on_timer_timeout():
	var spawn_pos_x = [-10, window_size.x+10][randi() % 2]
	var fish_scene = [goldfish_scene, greyfish_scene][randi() %2]
	
	var fish = fish_scene.instantiate()
	if spawn_pos_x > 0:
		fish.flipped = true
		
	fish.position = Vector2(spawn_pos_x, randi_range(window_size.y/2, window_size.y+(window_size.y/2)))
	get_parent().add_child(fish)
