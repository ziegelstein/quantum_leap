extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var dragging
var drag_start = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
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