extends RigidBody

#Context: THE BULLET
#Here, we define its overall direction and its functions when it hits a glass

#First, get the parent player (Which was a group, read the player.gd script for context)
onready var player := get_tree().get_nodes_in_group("player")
#This will return an array
#if we use this variable in a 'for' statement, it'll be acces- you get the idea

#Then, we create a direction variable which is an empty Vector3
#Here, we use this Vector3 to store the value the get_selection() func will give us
#(Check player.gd file and gun.gd file for context)
var direction := Vector3()

#Speed... Just speed..
var speed : float = 2.0

#Now, we create a function that can be activated by anything
func shoot() -> void:
	#We use apply_impulse() function to make this ball FLY
	apply_impulse(-direction, direction * speed)
	
	#Then we YIEELD
	#Basically, we add a node to the tree of node that we have
	#In this case... a timer counting 5 seconds
	#Then, we connect a signal to the timer, in this case, "timeout"
	yield(get_tree().create_timer(5.0), "timeout")
	
	#Then, after the 5 second mark, the ball will delete itself
	#Hence, queue_free()
	queue_free()
