extends KinematicBody2D

var RotateSpeed = 5
var Radius = 10
var _centre
var _angle = 0

func _ready():
	set_process(true)
	_centre = self.get_position()

func _physics_process(delta): 
	_angle += RotateSpeed * delta;
	var offset = Vector2(sin(_angle), cos(_angle)) * Radius;
	var pos = _centre + offset
	self.move_and_collide(pos) 