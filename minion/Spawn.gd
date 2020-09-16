extends Position2D
export (PackedScene) var npc




onready var player = get_parent().get_node("Player")

func _ready():
	$Timer.set_wait_time(2)
	$Timer.start()



func _on_Timer_timeout():
		print()
		var triangulo = npc.instance()
		triangulo.setPlayer(player)
		add_child(triangulo)


	

	


