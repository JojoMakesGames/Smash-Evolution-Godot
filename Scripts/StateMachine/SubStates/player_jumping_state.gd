extends PlayerAbilityState
class_name PlayerJumpingState


func enter():
	super.enter()
	player.velocity.y = player.JUMP_VELOCITY
	is_ability_done = true;
	state_machine.in_air.is_jumping = true
	player.move_and_slide()
	print("Enter Jump")
	
func exit():
	super.exit()
	print("Exit Jump")
