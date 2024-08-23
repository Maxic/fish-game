extends Node

var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
		
		
func goto_game_over_screen():
	call_deferred("_deferred_goto_scene", "res://scenes/game_over_screen.tscn")

func goto_main_game():
	call_deferred("_deferred_goto_scene", "res://main.tscn")

func goto_win_screen():
	call_deferred("_deferred_goto_scene", "res://scenes/win_screen.tscn")


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
