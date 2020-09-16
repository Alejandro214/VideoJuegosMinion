extends Area2D






func _on_Coin_body_entered(body):
	queue_free()


func _on_Cubo_body_entered(body):
	if(body.get_name() == "Player"):
		queue_free() 
