extends Area2D
signal hit



export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	screen_size = get_viewport_rect().size



func _process(delta):
	var velocity = Vector2()  
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta 
	position.x = clamp(position.x, 0 , screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)    	
	if velocity.x != 0:
	  $AnimatedSprite.animation = "walk"
	  $AnimatedSprite.flip_v = false
	  # See the note below about boolean assignment
	  $AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
		
		
func _on_Player_body_entered(body):
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false	



func _on_Player_hit():
	pass # Replace with function body.

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	$Player.start($StartPosition.position)
	$StartTimer.start()	
	
