extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var walls_scene = preload("res://Entities/Walls.tscn")
var player_scene = preload("res://Player/Player.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	add_walls(self)
#	add_player(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func add_walls(parent_node):
	parent_node.add_child(walls_scene.instance())
	
func add_player(parent_node):
	parent_node.add_child(player_scene.instance())