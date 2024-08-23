extends ColorRect


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if GameState.game_over or GameState.game_won:
		color.a += .01
		
	if color.a > .99 and GameState.game_over:
		SceneManager.goto_game_over_screen()
		
	if color.a > .99 and GameState.game_won:
		SceneManager.goto_win_screen()
