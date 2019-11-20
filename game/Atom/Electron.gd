extends RigidBody2D

var speed = 1

func _ready():
	pass
	
func _process(delta):
	if speed == 360:
		speed = 1
	else:
		speed+=1
	rotate(speed)
	linear_velocity = Vector2(speed % 90, speed % 90)