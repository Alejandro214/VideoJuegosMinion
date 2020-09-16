extends KinematicBody2D


var run_speed = 80
var velocity = Vector2.ZERO
var seguimiento = 0
var p 


func _physics_process(delta):
	if(p != null):
		velocity = (p.global_position - global_position ).normalized() * run_speed
		velocity = move_and_slide(velocity)


func setPlayer(player):
	p = player



func _ready():
	$Timer.set_wait_time(3)
	$Timer.start()

func set_seguimiento(n):
	seguimiento = n 




func _on_Timer_timeout():
	 queue_free()
