extends Node2D

@onready var bubble_scene = preload("res://scenes/bubble.tscn")
@onready var window_size = get_window().size

func _on_timer_timeout():
	var bubble = bubble_scene.instantiate()
	
	bubble.position = Vector2(randf_range(1, window_size.x-1), window_size.y + 10)
	#bubble.scale *= [1,2][randi() %2]
	get_parent().add_child(bubble)
