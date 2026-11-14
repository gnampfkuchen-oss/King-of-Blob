extends CharacterBody2D

var gravity = 8.1
var speed = 4

signal dead

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("right") and not is_on_floor():
		position.x += speed
	if Input.is_action_pressed("left") and not is_on_floor():
		position.x -= speed
	
	velocity.y += gravity
	position += velocity * delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Arena":
		dead.emit()
