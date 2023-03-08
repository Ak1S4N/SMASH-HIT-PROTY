extends RigidBody

#Context: THE GLASSSSS
#Here, we tackle the physics and functions of the glass
#Altough, this isn't like those glasses in the game that break...
#This glass is enough to move and function like how you're hitting an object

#We make a speed variable for when this node moves
#The reason why we need to make the glass moves...
#Due to functions that aren't present in Godot, we have to stick with this method
var speed : float = 0.03


#Now, if you know how to make something move smoothly, then this is an easy look
func _physics_process(delta: float) -> void:
	
	#First, we take the origin and direction of our glass, we add the origin with speed
	transform.origin.z += speed
	
	#We use the clamp function to limit the speed
	clamp(transform.origin.z, -speed, speed)

#We connect an Area node's (in the glass scene tree) signal to this script
func _on_Area_body_entered(body: Node) -> void:
	#This signal is used when a body (Rigid, Kinematic, Static, etc.) entered the area
	#hence, the name
	
	#first, we identify the body that entered the area
	if body.is_in_group("ball_bullet"):
		
		#next, if that body has been identified and found true,
		#we set the mode of this glass from static to rigid
		set_mode(RigidBody.MODE_RIGID)
		
		#lastly, we set the physics process (which handles the movement of the glass) to false
		#So it would look like not moving and dead
		set_physics_process(false)
