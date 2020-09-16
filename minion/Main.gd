extends Node

export (PackedScene) var npc

export (PackedScene) var spawn








var muerte = 0

var random = RandomNumberGenerator.new()

var cubos = []



func _physics_process(delta):
	if(get_child(0).name != "Player"):
		get_tree().reload_current_scene()
	
func set_up_spawn_enemys():
	var spa = spawn.instance()
	add_child(spa)
	set_position_random(spa)


func set_position_random(scene):
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	rand.randomize()
	var x = rand.randf_range(0,screen_size.x)
	rand.randomize()
	var y = rand.randf_range(0,screen_size.y)
	scene.position.x = x 
	scene.position.y = y 
	rand.randomize()
	var my_random_number = rand.randf_range(3, 4)
	print(my_random_number)
		

func _ready():
	 random.randomize()
	 var n = random.randi_range(3, 4)
	 $Timer.set_wait_time(3)
	 $Timer.start()
	 for i in range(0,n):
			set_up_spawn_enemys()

func _on_Timer_timeout():
	 var cubito = npc.instance()
	 var main = get_tree().get_nodes_in_group("Main")[0]
	 main.add_child(cubito)
	 cubos.append(cubito)
	 set_position_random(cubito)
	 contador()
	

func contador():
	var contador = 0
	for c in cubos:
		 if(c == null):
			 contador += 1
			 update_contador(contador)


func update_contador(contador):
	get_tree().get_nodes_in_group("contador")[0].text = String("Cubitos: " + str(contador))
			

