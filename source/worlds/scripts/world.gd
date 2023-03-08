extends Spatial


export var speed : float = 0.1
onready var walls := $walls

func _physics_process(delta: float) -> void:
	
	walls.transform.origin.z += speed
	clamp(walls.transform.origin.z, -3.0, 3.0)
	
