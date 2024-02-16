extends StaticBody2D

var screen_size 

func _ready():
	screen_size = get_viewport_rect().size
	
	
# checks for input and moves the paddle up and down
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up_p2"):
		velocity.y -= 1000
		#clamp(screen_size ,screen_size.x, screen_size.y)
	if Input.is_action_pressed("move_down_p2"):
		velocity.y += 1000
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

