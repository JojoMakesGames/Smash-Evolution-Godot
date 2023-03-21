extends PlayerState
class_name PlayerAbilityState

var is_ability_done: bool

func handle_input(delta):
	super.handle_input(delta)
	if is_ability_done:
		if player.is_on_floor() and player.velocity.y > -0.01:
			state_machine.change_state(state_machine.idle)
		else:
			state_machine.change_state(state_machine.in_air)

