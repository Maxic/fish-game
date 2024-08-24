extends Sprite2D

var time: float
# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > 2:
		if self.scale.x <= 1:
				self.scale += Vector2(delta,delta)
