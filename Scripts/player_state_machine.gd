extends Node

class_name PlayerStateMachine

const DEBUG = true

var state: PlayerState

var player: Player
@export var idle: PlayerIdleState
@export var moving: PlayerMovingState
@export var jumping: PlayerJumpingState
@export var in_air: PlayerInAirState

func _ready():
	player = get_parent()
	state = get_child(0) as PlayerState
	state.state_machine = self
	state.player = self.player
	state.enter()
	
func change_state(new_state: PlayerState):
	state.exit()
	state = new_state
	if !state.state_machine:
		state.state_machine = self
	if !state.player:
		state.player = player
	state.enter()

