extends Node2D

@onready var swordfish_scene = preload("res://scenes/swordfish.tscn")
@export var speed: float = 1
var direction: Vector2 = Vector2(0,-1)
@onready var window_size = Vector2(320, 480)
var scroll_down: bool = true
var scroll_up: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if scroll_up and not GameState.game_won:
		direction = Vector2(0,1)
		translate(direction * speed*2)
	
	if scroll_down:
		translate(direction * speed)
	
	if GameState.chest_grabbed:
		scroll_up = true
	
	

func _on_visible_on_screen_notifier_2d_mid_screen_exited():
	GameState.middle_reached = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	scroll_down = false
	GameState.bottom_reached = true

func _on_visible_on_screen_notifier_2d_swordfish_screen_exited():
	if GameState.chest_grabbed:
		var swordfish = swordfish_scene.instantiate()
		swordfish.position = Vector2(window_size.x/2, window_size.y+10)
		get_parent().add_child(swordfish)


func _on_box_area_body_entered(body):
	if body.name == "Chest":
		GameState.chest_grabbed = true


func _on_win_area_body_entered(body):
	if body.name == "Chest":
		GameState.game_won = true
