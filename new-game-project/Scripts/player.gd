extends CharacterBody2D

var gravity = 18
var speed = 4
var bounceforce = 600

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
	

func bouncefunc():
	velocity.y = -bounceforce

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Arena":
		dead.emit()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "enemy1" or area.name.begins_with("@Area2D"):
		bouncefunc()
		point.emit()
