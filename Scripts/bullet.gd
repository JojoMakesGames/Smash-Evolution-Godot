extends Area2D

@export var speed: int = 300
@export var rotation_spped: float = 0.2
@export var travel_time_ms: int = 200
@export var acceleration: float = .5
var direction: Vector2 = Vector2.ZERO
var start_point: Vector2 = Vector2.ZERO
var start_time: int = 0
var originating_object: Node2D = null
var returning: bool = false


func _physics_process(delta):
	if self.direction == Vector2.ZERO or self.start_point == Vector2.ZERO or self.start_time == 0:	
		return
	self.returning = Time.get_ticks_msec() - start_time > travel_time_ms
	var bodies = get_overlapping_bodies()
	if returning:
		if originating_object in bodies:
			self.free()
			return
	
	self.rotate(rotation_spped)
	if returning:
		self.position -= direction * delta * speed
	else:
		self.position += direction * delta * speed
	
	
		
	
func init(direction: Vector2, start_point: Vector2, start_time: int, originating_object: Node2D):
	self.direction = direction
	self.start_point = start_point
	self.start_time = start_time
	self.position = start_point
	self.originating_object = originating_object
	self.returning = false
