extends PlayerState
class_name PlayerGroundedState


func handle_input(delta):
	super.handle_input(delta)
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state(state_machine.jumping)
