extends RigidBody2D

var reparented: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameState.chest_grabbed:
		$hook.disabled = true
		$box.disabled = false
		#if not reparented:
			#parent_to_hook()
		

func parent_to_hook():
	reparented = true
	var new_parent = get_parent().get_parent().get_node("%hook")
	get_parent().remove_child(self)
	self.position = Vector2(0,0)
	new_parent.add_child(self)
	
