extends CharacterBody2D

var gravity = 18
var speed = 4

signal dead
signal point

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
	

func bouncefunc(force):
	velocity.y = -force

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Arena":
		dead.emit()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.name)
	if area.name == "enemy1":
		bouncefunc(600)
		point.emit()
	if area.name == "enemy2":
		bouncefunc(750)
		point.emit()
