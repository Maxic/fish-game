extends Node2D


@export var speed: float = 1
var direction: Vector2 = Vector2(0,-1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	translate(direction * speed)
