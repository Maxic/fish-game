extends Node2D

var time: float
var zwaan_scene = load("res://scenes/zwaan.tscn")
@onready var window_size = Vector2(320, 480)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > 3:
		var zwaan_amount = randi_range(0,3)
		for x in zwaan_amount:
			var zwaan_inst = zwaan_scene.instantiate()
			zwaan_inst.position = Vector2(window_size.x+50, randi_range(10,100))
			zwaan_inst.speed = 10+randi_range(0,5)
			add_child(zwaan_inst)
			time = -10
			
