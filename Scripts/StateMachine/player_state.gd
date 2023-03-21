extends Node2D
class_name PlayerState

	
var start_time: int
var player: Player
var state_machine: PlayerStateMachine
var can_shoot: bool:
	get: return state_machine.shooting.can_shoot

func enter():
	start_time = Time.get_ticks_msec()
	
func exit():
	pass
	
func do_checks():
	pass
	
func physics_update(_delta):
	do_checks()

func handle_input(_delta):
	pass
