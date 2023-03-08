extends RigidBody

onready var area := $Area

var speed : float = 0.03

func _physics_process(delta: float) -> void:
	transform.origin.z += speed
	clamp(transform.origin.z, -speed, speed)

func _on_Area_body_entered(body: Node) -> void:
	if body.is_in_group("ball_bullet"):
		set_mode(RigidBody.MODE_RIGID)
		set_physics_process(false)
