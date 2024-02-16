extends StaticBody2D

@export var speed = 400
var screen_size 

func _ready():
	screen_size = get_viewport_rect().size
	#apply_impulse(impulse: (200, 200), position: Vector2 = Vector2(0, 0))
	
	
# checks for input and moves the paddle up and down
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1000
		#clamp(screen_size ,screen_size.x, screen_size.y)
	if Input.is_action_pressed("move_down"):
		velocity.y += 1000
	position += velocity * delta 
	position = position.clamp(Vector2.ZERO, screen_size)
