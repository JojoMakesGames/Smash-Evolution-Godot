extends PlayerGroundedState
class_name PlayerMovingState

var direction: float: 
	get: 
		return Input.get_axis("move_left", "move_right")

func enter():
	super.enter()
	
func exit():
	super.exit()

func do_checks():
	super.do_checks()
	
func physics_update(delta):
	super.physics_update(delta)
	direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = move_toward(player.velocity.x, direction * player.SPEED, player.acceleration)
	
	player.move_and_slide()
	

func handle_input(delta):
	super.handle_input(delta)
	if player.velocity.x == 0 and direction == 0:
		state_machine.change_state(state_machine.idle)
	if !player.is_on_floor():
		state_machine.change_state(state_machine.in_air)

