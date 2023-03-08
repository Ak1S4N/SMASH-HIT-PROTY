extends Camera

#context of this node:
#this is the main player
#Here, we got visuals, getting directions where we shoot the balls, and etc.

#Node Group: player
#I gave it a group so it could be accessible to other nodes

#define mouse as an empty Vector2
var mouse = Vector2()

onready var gun : Node = get_parent().get_node("gun")

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		#what I did here basically gives definition to 'mouse'
		#the position of the event, defined by the InputEventMouse
		#it passes the position of said event to the variable
		mouse = event.position
		
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			
			#Now, here, we use the function we made to get a value of a position we click at
			#And, we use that position we clicked to give the bullet the direction
			#(Go to ball_bullet.gd file for context)
			var position_target = get_selection()
			gun.shoot(position_target)
			
	
	
func get_selection():
	#this get_selection has a goal to get any object in the world
	
	#this variable below defines the world and physics state
	#implied by the function: get_world()
	#you can learn more about the function by ctrl + LMB (but I'd assume you already know)
	var world_space = get_world().direct_space_state
	
	#this variable below defines a projected ray...
	#it gives a starting point origin of a ray, hence the name
	var start = project_ray_origin(mouse)
	
	#when the ray is projected, this variable ends it
	#it gives basically a defined length following the variable on top of this comment
	var end = project_position(mouse, 1000)
	
	#Wow, look Mom! Rays!
	#You scramble all of 'em. you define the ray in 'intersect_ray()'
	#you give the ray starting and ending points, which are the variables made before
	var result = world_space.intersect_ray(start, end)
	
	#note: don't be like me, don't forget to give the object you want to click some collision shape
	#No, you didn't see my mistake, this is a demo, you saw nothing
	#print(result) if you want to see the whole result
	#Also, for our purposes, we'll only need the position of the result
	#For this process is only for dem shootin ballz, alright?
	return result.position

