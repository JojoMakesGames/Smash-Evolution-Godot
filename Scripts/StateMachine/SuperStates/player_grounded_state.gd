extends PlayerState
class_name PlayerGroundedState


func handle_input(delta):
	super.handle_input(delta)
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state(state_machine.jumping)
	elif Input.is_action_pressed("shoot") and state_machine.shooting.check_can_shoot(Time.get_ticks_msec()):
		state_machine.change_state(state_machine.shooting)
