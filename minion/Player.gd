extends KinematicBody2D

export (int) var speed = 200


var velocity = Vector2()
var target = Vector2()

func _input(event):
		target = get_global_mouse_position()	
		if Input.is_action_just_pressed("ui_select"):
			dash()
func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)

func dash():
	speed = speed * 3
	$Timer.set_wait_time(0.4)
	$Timer.start()


func _on_Timer_timeout():
	speed = 200


func _on_Area2D_body_entered(body):
	if(body.get_name().find("Enemy") != -1 || body.get_name() == "Enemy"):

		queue_free()

	
