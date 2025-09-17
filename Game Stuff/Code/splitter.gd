extends RayCast2D

var startPos: Vector2 = Vector2(-100,-100)
var endPos: Vector2 = Vector2(100,100)

var points: Array = []

var speed = 100

var done: bool = true


func _ready() -> void:
	position = startPos
	target_position = endPos


#just get entry and exit points (maybe use raycast instead)
func _physics_process(delta: float) -> void:
	
	if !done:
		force_raycast_update()
		points.append(get_collision_point())
		
		position = endPos
		target_position = startPos
		
		force_raycast_update()
		points.append(get_collision_point())
		done = true
		print(points)
		
#CREATE A POLYGON WITH THESE POINTS AND SIZE /2

func _on_timer_timeout() -> void:
	done = false
