extends Position2D

export (PackedScene) var npc 


var e = preload("res://Enemy.tscn").instance()

func _ready():
	$Timer.set_wait_time(1)
	$Timer.start()


func _on_Timer_timeout():
	var f = npc.instance()
	get_tree().get_nodes_in_group("Position2D")[0].add_child(f)
	f.position = global_position
	
