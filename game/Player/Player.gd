extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var dragging
var drag_start = Vector2()
var energy = 100

var rotate = false
var rotation_speed = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	set_scale(Vector2(0.2,0.2))
	
func _physics_process(delta):
#	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
#		var mouse_pos = get_viewport().get_mouse_position()
#		var distance = mouse_pos.distance_to(self.position)
#		print(mouse_pos)
#		apply_impulse(Vector2(),mouse_pos*0.1)
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and not dragging:
		dragging = true
		drag_start = get_global_mouse_position()
	if not Input.is_mouse_button_pressed(BUTTON_LEFT) and dragging:
		dragging = false
		var drag_end = get_global_mouse_position()
		var dir = drag_start - drag_end
		apply_impulse(Vector2(), dir * 5)
		
func _integrate_forces(state):
	if(Input.is_mouse_button_pressed(BUTTON_RIGHT)):
		linear_velocity = Vector2(0,0)


func set_scale(scale):
	# Override behaviour only if it is a RigidBody2D and do not touch other nodes
	if self is RigidBody2D:
		for child in self.get_children():
			if not child.has_meta("original_scale"):
				# save original scale and position as a reference for future modifications
				child.set_meta("original_scale",child.get_scale())
				child.set_meta("original_pos",child.get_position())
			var original_scale = child.get_meta("original_scale")
			var original_pos = child.get_meta("original_pos")
			# When scaled, position also has to be changed to keep offset
			child.set_position(original_pos * scale)
			child.set_scale(original_scale * scale)
	else:
		set_scale(scale)

func _process(delta):
	if rotate and self.mode == RigidBody2D.MODE_STATIC:
		self.rotation_degrees = self.rotation_degrees + self.rotation_speed

func dock(atom):
	set_physics_process(false)
	self.mode = RigidBody2D.MODE_STATIC
	self.position = Vector2(500,300)#atom.position
	$Sprite.offset = Vector2(100,0)
	self.rotate = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func look_follow(state, current_transform, target_position):
#    var up_dir = Vector3(0, 1, 0)
#    var cur_dir = current_transform.basis.xform(Vector3(0, 0, 1))
#    var target_dir = (target_position - current_transform.origin).normalized()
#    var rotation_angle = acos(cur_dir.x) - acos(target_dir.x)
#
#    state.set_angular_velocity(up_dir * (rotation_angle / state.get_step()))
#
#func _integrate_forces(state):
#    var target_position = $my_target_spatial_node.get_global_transform().origin
#    look_follow(state, get_global_transform(), target_position)