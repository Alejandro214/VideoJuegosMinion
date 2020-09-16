extends Node2D


export (PackedScene) var npc


func _ready():
	$Timer.set_wait_time(1)
	$Timer.start()



func _on_Timer_timeout():
	var triangulo = npc.instance()

	get_tree().get_nodes_in_group("Node2D")[0].add_child(triangulo)



