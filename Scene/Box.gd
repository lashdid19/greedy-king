extends KinematicBody2D

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += 40
	
	if is_on_floor() :
		velocity.y = 0
	
	move_and_slide(velocity, Vector2.UP)
