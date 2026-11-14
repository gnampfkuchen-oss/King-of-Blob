extends CharacterBody2D

var gravity = 18
var speed = 4

signal point

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity = 0
	while not Input.is_anything_pressed(): await get_tree().process_frame
	gravity = 18


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("right") and not is_on_floor():
		position.x += speed
	if Input.is_action_pressed("left") and not is_on_floor():
		position.x -= speed

	
	if velocity.y > 0:
		$AnimatedSprite2D.play("down")
	if velocity.y < 0:
		$AnimatedSprite2D.play("up")
	if velocity.y == 0:
		$AnimatedSprite2D.play("default")
	
	velocity.y += gravity
	position += velocity * delta
	move_and_slide()
	clamp_to_screen()
	

func bouncefunc(force):
	velocity.y = -force

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Arena":
		position = Vector2(550, 180)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy1"):
		bouncefunc(600)
		point.emit()
	elif area.is_in_group("enemy2"):
		bouncefunc(750)
		point.emit()
	elif area.is_in_group("enemy3"):
		bouncefunc(500)
		point.emit()
		

func clamp_to_screen() -> void:
	var rect := get_viewport_rect()
	position.x = clamp(position.x, 0.0, rect.size.x - 50)
