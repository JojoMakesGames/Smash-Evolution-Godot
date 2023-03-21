extends CharacterBody2D
class_name Player

@export var SPEED: float
@export var JUMP_VELOCITY: float
@export var state_machine: PlayerStateMachine
@export var acceleration: float
var is_facing_right: bool = true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	state_machine.state.physics_update(delta)

func _process(delta):
	state_machine.state.handle_input(delta)
