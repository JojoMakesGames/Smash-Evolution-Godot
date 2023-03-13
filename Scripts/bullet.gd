extends Area2D
class_name Bullet

var shoot
export (PackedScene) var bullet
onready var Bullet_container = ()

func _shoot():
	var pew = bullet.instance()
	Laser_container.add_child(pew)

	pew.shoot(get_global_mouse_position(), global_position)
