extends PlayerAbilityState
class_name PlayerShootingState

@onready var BULLET = preload("res://Scenes/bullet.tscn")
var start_shot: int

func enter():
	super.enter()
	var bullet: RigidBody2D = BULLET.instantiate()
	bullet.position = get_angle_to(bullet.get_global_mouse_position(), bullet.get_position())
	#var mouse_position = player.get_viewport().get_mouse_position()
	var angle = rad_to_deg(bullet.position.angle_to(player.position))
	print(angle)
	bullet.apply_impulse(Vector2(500, 0).rotated(angle), Vector2())
	get_parent().get_parent().get_parent().add_child(bullet)
	start_shot = start_time
	
	is_ability_done = true
	

func check_can_shoot(current: int):
	return current - start_shot > 200

