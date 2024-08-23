extends Node

var middle_reached: bool = false
var bottom_reached: bool = false
var chest_grabbed: bool = false
var game_over: bool = false
var game_won: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("restart"):
		restart()


func restart():
	middle_reached = false
	bottom_reached = false
	chest_grabbed = false
	game_over = false
	game_won = false
	SceneManager.goto_main_game()
