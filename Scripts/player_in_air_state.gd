extends PlayerState
class_name PlayerInAirState

var direction: float
var is_jumping: bool
var cut_jump: bool
var time_since_jump: int
var jump_input_stop: bool:
	get: return state_machine.jumping.jump_input_stop
var gravity

func enter():
	super.enter()
	print("Enter in air")
	
func exit():
	super.exit()
	print("Exit in air")

func do_checks():
	super.do_checks()
	
func physics_update(delta):
	super.physics_update(delta)
	check_jump_multiplier()
	gravity = player.gravity * 3 if player.velocity.y > 0 else player.gravity
	player.velocity.y += gravity * delta
	direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = move_toward(player.velocity.x, direction * player.SPEED, player.SPEED)
	
	player.move_and_slide()

func handle_input(delta):
	super.handle_input(delta)
	if(player.is_on_floor()):
		state_machine.change_state(state_machine.idle)
		
func check_jump_multiplier():
	if is_jumping:
		time_since_jump = Time.get_ticks_msec() - start_time
		if !cut_jump:
			cut_jump = !Input.is_action_pressed("jump") and time_since_jump < 200
		if cut_jump and 200 < time_since_jump:
			player.velocity.y = 0
			is_jumping = false
			cut_jump = false
		elif player.velocity.y >= 0:
			is_jumping = false;
			cut_jump = false;

