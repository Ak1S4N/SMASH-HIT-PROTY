extends Position3D

#Now, the main point of SMASH HIT
#SHOOTIN BALLZ

#BULLET SUMMONING JUTSU
#First, we make a variable with a preloaded bullet in it
#(check ball_bullet.tscn for context of the bullet)
onready var bullet := preload("res://source/objects/ball_bullet/scene/ball_bullet.tscn")

#Now, we make our own function in which is can be used by our player
#Also, we must send a target Vector3 to the bullet so it would know its direction
func shoot(target) -> void:
	
	#First, we make a variable with the instanced bullet in it
	#don't know what instance is? ctrl + left click the function 'instance()'
	var bullet_instance = bullet.instance()
	
	#Next, we define the bullet's direction
	bullet_instance.direction = target
	
	#When instanced, the scene can finally be spawned in the game
	#by adding this scene to a node as a child
	add_child(bullet_instance)
	bullet_instance.shoot()
	
