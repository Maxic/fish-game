extends Node2D

@onready var swordfish_scene = preload("res://scenes/swordfish.tscn")
@export var speed: float = 1
var direction: Vector2 = Vector2(0,-1)
var scroll: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if scroll:
		translate(direction * speed)

func _on_visible_on_screen_notifier_2d_mid_screen_exited():
	GameState.middle_reached = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	scroll = false
	GameState.bottom_reached = true

func _on_visible_on_screen_notifier_2d_swordfish_screen_exited():
	var swordfish = swordfish_scene.instantiate()
	
	swordfish.position = Vector2(-10, 10)
	#bubble.scale *= [1,2][randi() %2]
	get_parent().add_child(swordfish)
