extends Spatial

#Context: THE WORLDDDDDD
#Here, we make the 'world' move towards the player (just like in smash hit)
#We would make an illusion that the camera is the one moving, but not really

#FIRST, THE SPEED OF THE WORLD
export var speed : float = 0.1

#NEXT, we grab the wall nodes (check the scene tree for context) so we can control it
onready var walls := $walls

#Physics process... we already know what this is...
#It makes a function active every fps
func _physics_process(delta: float) -> void:
	
	#First, we get the origin and direction of the walls and give it speed
	walls.transform.origin.z += speed
	
	#Next, we use the clamp function to limit the speed :>
	#For more context of this function, press 'ctrl' + 'left mouse button' to the clamp function
	clamp(walls.transform.origin.z, -3.0, 3.0)
	
