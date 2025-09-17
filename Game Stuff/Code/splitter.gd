extends Area2D

var startPos: Vector2 = Vector2(-100,-100)
var endPos: Vector2 = Vector2(100,100)

var points: Array = []

var speed = 100

var done: bool = false

func _ready() -> void:
	position = startPos


#just get entry and exit points (maybe use raycast instead)
func _physics_process(delta: float) -> void:
	if !done:
		if get_overlapping_bodies().size() >= 1:
			points.append(position)
		if position != endPos:
			global_position = global_position.move_toward(endPos, speed * delta)
			print(position)
		else:
			done = true
			print(points)
		
