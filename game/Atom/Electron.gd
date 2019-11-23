extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var rotate = false
export var rotation_speed = 1
export var radius = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	self.offset = Vector2(radius,0)
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(rotate):
		self.rotation_degrees = self.rotation_degrees + rotation_speed
