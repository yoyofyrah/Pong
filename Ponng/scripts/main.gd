extends Node2D

#@onready var is_touching = $shapeAI

var p1_score = 0
var p2_score = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$score_p1.text = str(p1_score)
	$countdown.visible = false
	$countdown.text = str($countTimer.time_left)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$countdown.text = str($countTimer.time_left)
	if $countTimer.time_left == 0:
		$countdown.visible = false
	#if is_touching.is_colliding() == true:
		#print("ass")

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		$unpause.visible = true

func _on_unpause_pressed() -> void:
	print("butt")
	$unpause.visible = false
	get_tree().paused = false


func _on_start_pressed() -> void:
	$start.visible = false
	$countTimer.start()
	$countdown.visible = true
	
func _on_timer_timeout() -> void:
	$ball.visible = true
	$net.visible = true
	$ball.velocity = Vector2(1300, randf_range(20, 180))


func _on_right_wall_body_entered(body: Node2D) -> void:
	p1_score = p1_score + 1
	$score_p1.text = str(p1_score)
	$ball.position = get_viewport().size / 2
	$ball.position.y = randf_range(250, 450)


func _on_left_wall_body_entered(body: Node2D) -> void:
	p2_score = p2_score + 1
	$score_p2.text = str(p2_score)
	$ball.position = get_viewport().size / 2
	$ball.position.y = randf_range(250, 450)
	
	

