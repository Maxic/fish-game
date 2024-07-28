extends ColorRect


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if SceneManager.game_over:
		color.a += .01
		
	if color.a > .99:
		SceneManager.goto_game_over_screen()
