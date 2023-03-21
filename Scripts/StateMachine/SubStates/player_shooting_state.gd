extends PlayerAbilityState
class_name PlayerShootingState

@onready var BULLET = preload("res://Scenes/bullet.tscn")
var start_shot: int

func enter():
	super.enter()

	var mouse_position = get_global_mouse_position()

	var direction_to_mouse = player.global_position.direction_to(mouse_position).normalized()
	start_shot = start_time
	var bullet: Area2D = BULLET.instantiate()
	bullet.init(direction_to_mouse, player.position, start_time, player)
	bullet.position = player.position
	player.get_parent().add_child(bullet)
	
	
	
	is_ability_done = true
	

func check_can_shoot(current: int):
	return current - start_shot > 500

