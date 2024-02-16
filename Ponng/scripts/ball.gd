extends CharacterBody2D

var collision_data

func _ready():
	velocity = Vector2(0, 0)

func _physics_process(delta: float) -> void:
	collision_data = move_and_collide(velocity * delta)
	if collision_data:
		velocity.y += randf_range(-20, 20)
		velocity = velocity.bounce(collision_data.get_normal())
